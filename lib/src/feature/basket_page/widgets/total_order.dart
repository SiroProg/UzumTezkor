import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';

class TotalOrder extends ConsumerWidget {
  const TotalOrder({
    required this.leftPadding,
    super.key,
  });

  final double leftPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderModel order = ref.watch(orderNotifier)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: leftPadding / 2),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: leftPadding / 2,
          vertical: 20,
        ),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
          border: Border.all(color: Colors.black54),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "К оплате",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  "${order.totalPrice} сум",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.deepPurple,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Заказ",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  "${order.productsTotal} сум",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w200,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Доставка",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  order.deliveryPrice,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w200,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Работа сервиса",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                Text(
                  "${order.restaurant.servicePrice} сум",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w200,
                      ),
                ),
              ],
            ),
            if (order.promocode != null && order.promocode!.isActive)
              const SizedBox(height: 15),
            if (order.promocode != null && order.promocode!.isActive)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Скидка по промокод (${order.promocode!.discountAmount} %)",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w200,
                          color: Colors.green,
                        ),
                  ),
                  Text(
                    "- ${order.getDiscount} сум",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
