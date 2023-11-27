import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PaymentType extends ConsumerWidget {
  const PaymentType({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: const InfoTileItem(
        icon: Icons.credit_card,
        subTitle: 'UzCard, Humo, MasterCard, Visa',
        title: 'Картой',
        isExistLeftIcon: true,
      ),
    );
  }
}
