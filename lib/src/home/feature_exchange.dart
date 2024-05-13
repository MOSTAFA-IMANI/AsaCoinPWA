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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        shrinkWrap: true,
        children: featureList.map((item) {
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
              Text(
                item.name,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
