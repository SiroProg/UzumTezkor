import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InfoTileItem(
        icon: Icons.discount,
        subTitle: AppLocalizations.of(context).viberi,
        title: AppLocalizations.of(context).promoExist,
        isExistLeftIcon: true,
      ),
    );
  }
}
