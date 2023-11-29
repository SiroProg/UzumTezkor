import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PaymentType extends ConsumerWidget {
  const PaymentType({
    this.isModifiable = true,
    super.key,
  });

  final bool isModifiable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderModel order = ref.watch(orderNotifier)!;

    void showBottomPaymentModal() {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Column(
              children: [
                GestureDetector(
                  onTap:() {
                    ref.read(orderNotifier.notifier).updateOrder(
                          paymentType: PaymentTypeEnum.card,
                        );
                    Navigator.of(context).pop();
                  },
                  child: InfoTileItem(
                    title: PaymentTypeEnum.card.type,
                    subTitle: PaymentTypeEnum.card.description,
                    icon: Icons.credit_card,
                    isSelected: order.paymentType == PaymentTypeEnum.card,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(orderNotifier.notifier).updateOrder(
                          paymentType: PaymentTypeEnum.cash,
                        );
                    Navigator.of(context).pop();
                  },
                  child: InfoTileItem(
                    title: PaymentTypeEnum.cash.type,
                    subTitle: PaymentTypeEnum.cash.description,
                    icon: Icons.money,
                    isSelected: order.paymentType == PaymentTypeEnum.cash,
                  ),
                )
              ],
            );
          });
    }

    return GestureDetector(
      onTap:  isModifiable ? showBottomPaymentModal:null,
      child: InfoTileItem(
        icon: Icons.credit_card,
        subTitle: order.paymentType.description,
        title: order.paymentType.type,
        isExistLeftIcon: true,
      ),
    );
  }
}
