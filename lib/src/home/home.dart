import 'package:asacoine/src/home/possibilities.dart';
import 'package:asacoine/src/home/symbols.dart';
import 'package:flutter/material.dart';

import 'feature_exchange.dart';
import 'footer_home.dart';
import 'header_home.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HeaderHomeWidget(),
              FeatureExchangeWidget(),
              PossibilitiesWidget(),
              SymbolsWidget(),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
