import 'package:flutter/material.dart';

import '../../../common/localization/app_localizations.dart';

class EmptyBasket extends StatelessWidget{
  const EmptyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "asset/images/no-basket.png",
            fit: BoxFit.cover,
            width: 300,
          ),
          const SizedBox(height: 15),
          Text(
            AppLocalizations.of(context).tutPusto,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            AppLocalizations.of(context).vernites,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

}