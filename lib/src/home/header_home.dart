import 'dart:async';

import 'package:asacoine/src/home/repository/home_repository.dart';
import 'package:asacoine/src/model/ResponseNetwork.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../generated/assets.dart';
import '../model/AppBanner.dart';
import '../urls.dart';
import '../utils.dart';
import '../webview/web_view.dart';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({super.key});

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  late StreamController<ResponseNetwork<List<AppBanner>>> bannerList;
  final LoopPageController controller =
      LoopPageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;
  int _bannerCount = 0;

  @override
  void initState() {
    bannerList = StreamController<ResponseNetwork<List<AppBanner>>>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchData();
    });
    _startTimer();
    super.initState();
  }

  _fetchData() async {
    HomeRepository homeRepository = HomeRepository.getInstance();
    bannerList.add((await homeRepository.getBanners()));
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        color: Color(0x508C8C8C),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    Assets.imagesLogoType,
                    height: 35,
                  ),
                ),
              ),
              Text(
                "آساکوین الکترونیک",
                textDirection: TextDirection.rtl,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                "به کامل ترین صرافی ارز دیجیتال خوش آمدید 👋",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: StreamBuilder(
                      stream: bannerList.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isSuccess) {
                            final data = snapshot.data!.data;
                            _bannerCount = data.length;
                            return SizedBox(
                              height: 200,
                              child: LoopPageView.builder(
                                controller: controller,
                                itemCount: data.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Material(
                                        child: InkWell(
                                          onTap: () {
                                            if (data[index]
                                                .deepLink
                                                .isNotEmpty) {
                                              if (data[index].isInternalLink) {
                                                final link =
                                                    data[index].deepLink;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewApp(
                                                      url: link,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                Utils.launchUrl(
                                                    data[index].deepLink);
                                              }
                                            }
                                          },
                                          child: Image.network(
                                            data[index].imageUrl,
                                            fit: BoxFit.fill,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey,
                                                enabled: true,
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  color: Colors.grey,
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, child, error) {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey,
                                                enabled: true,
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  color: Colors.grey,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Lottie.asset(Assets.animAnim);
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewApp(
                        url: AppUrls.login,
                      ),
                    ),
                  )
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                  child: Text(
                    "ورود",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewApp(
                          url: AppUrls.signUp,
                        ),
                      ),
                    )
                  },
                  /*
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                   */
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0.7, // Underline width
                          ),
                        ),
                      ),
                      child: Text(
                        "ثبت نام",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () =>
                          {Utils.launchUrl("https://t.me/zp_cryptotraining")},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "آموزش بازار ارز دیجیتال",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          {Utils.launchUrl("https://t.me/Zp_Academy/14")},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "آموزش ثبت نام در صرافی",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_bannerCount > 0) {
        _currentPage = (_currentPage + 1) % _bannerCount; // Wrap around
        controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutSine,
        );
      }
    });
  }
}
