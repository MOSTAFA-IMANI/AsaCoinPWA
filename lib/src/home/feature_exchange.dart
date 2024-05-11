import 'package:asacoine/src/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeatureExchangeWidget extends StatelessWidget {
  const FeatureExchangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeRepository = HomeRepository.getInstance();
    final featureList = homeRepository.getFeatureOfExchange();
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        height: (featureList.length / 4 + 1) * 54 + 16,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 24,
                  spacing: 20,
                  children: List.generate(featureList.length, (index) {
                    final item = featureList[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            item.icon,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn,
                            ),
                            height: 28,
                            width: 28,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            item.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
