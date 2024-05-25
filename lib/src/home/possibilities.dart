import 'dart:async';

import 'package:asacoine/src/home/repository/home_repository.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../model/Possibility.dart';

class PossibilitiesWidget extends StatefulWidget {
  const PossibilitiesWidget({super.key});

  @override
  State<PossibilitiesWidget> createState() => _PossibilitiesWidgetState();
}

class _PossibilitiesWidgetState extends State<PossibilitiesWidget> {
  List<Possibility> possibilityList = [];
  late HomeRepository homeRepository;
  final LoopPageController controller = LoopPageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    homeRepository = HomeRepository.getInstance();
    possibilityList = homeRepository.getPossibilities();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "چرا باید آساکوین را انتخاب کنیم؟",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: LoopPageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  controller: controller,
                  itemCount: possibilityList.length,
                  itemBuilder: (context, index) {
                    Possibility item = possibilityList[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                item.icon,
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              item.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            right: 20.0,
            bottom: 10.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: DotsIndicator(
                dotsCount: possibilityList.length,
                position: _currentPage,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _currentPage = (_currentPage + 1) % possibilityList.length; // Wrap around
      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutSine,
      );
    });
  }
}
