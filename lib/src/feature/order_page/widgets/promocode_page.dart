import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PromoCode extends ConsumerWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderModel order = ref.watch(orderNotifier)!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Промокод"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InfoTileItem(
            icon: Icons.discount,
            subTitle: "${order.promocode!.discountAmount}",
            title: order.promocode!.title,
          ),
        ],
      ),
    );
  }
}
