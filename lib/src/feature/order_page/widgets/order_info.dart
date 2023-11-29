import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment_type.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/total_order.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    String deliveryInfo(OrderModel order) {
      if (order.isDelivered) {
        return " .Доставлен";
      }
      int seconds = DateTime.now().difference(order.deliveredTime).inSeconds;
      String minute = ((seconds ~/ 60)).toString().padLeft(2, "0");
      String second =
          (seconds - ((seconds ~/ 60) * 60)).toString().padLeft(2, "0");
      return " $minute:$second осталос до доставлен";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Заказ"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              order.restaurant.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            subtitle: Text(
              "${DateFormat.yMMMMd('en_US').add_jm().format(
                    order.date,
                  )} ${deliveryInfo(order)}",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            title: Text(
              "${order.products.length} элементы",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.deepPurple,
                  ),
            ),
            trailing: Text(
              "${order.totalPrice} сум",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.green,
                  ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (BasketModel b in order.products)
                  Text(
                    "${b.productModel.title} x ${b.amount}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  )
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              AppLocalizations.of(context).adress,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          InfoTileItem(subTitle: "${order.placeLocation.address} }"),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Способ оплаты",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          const PaymentType(isModifiable: false),
          const PromoCode(isModifiable: false),
          const TotalOrder(leftPadding: 20)
        ],
      ),
    );
  }
}
