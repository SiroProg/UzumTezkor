import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PromoCode extends StatelessWidget{
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const InfoTileItem(
        icon: Icons.discount,
        subTitle: 'Выберите или введите новый',
        title: 'Эсть промокод?',
        isExistLeftIcon: true,
      ),
    );
  }

}