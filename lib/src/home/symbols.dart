import 'dart:async';

import 'package:asacoine/src/home/repository/home_repository.dart';
import 'package:flutter/material.dart';

import '../model/Symbol.dart';
import '../urls.dart';
import '../webview/web_view.dart';

class SymbolsWidget extends StatefulWidget {
  const SymbolsWidget({super.key});

  @override
  State<SymbolsWidget> createState() => _SymbolsWidgetState();
}

class _SymbolsWidgetState extends State<SymbolsWidget> {
  late StreamController<List<Symbol>> symbolList;

  @override
  void initState() {
    symbolList = StreamController<List<Symbol>>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchData();
    });
    super.initState();
  }

  _fetchData() async {
    HomeRepository homeRepository = HomeRepository.getInstance();
    symbolList.add((await homeRepository.getPopularSymbol()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "نرخ لحظه ای ارزهای دیجیتال",
                textDirection: TextDirection.rtl,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "نام ارز",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    " قیمت",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "24h",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: StreamBuilder<List<Symbol>>(
                stream: symbolList.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: snapshot.data!.map(
                        (symbol) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            symbol.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.network(
                                              symbol.logo,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        formatDouble(symbol.price),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${symbol.changeRate}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: symbol.changeRate >= 0
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.4,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewApp(
                          url: AppUrls.login,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "نمایش بیشتر...",
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDouble(double number) {
    String result = number.toStringAsFixed(3);

    result = result.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');

    return result;
  }
}
