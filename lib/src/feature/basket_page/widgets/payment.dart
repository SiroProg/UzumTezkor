import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_identifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment_type.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';

class Payment extends ConsumerWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double leftPadding = 20;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Оплата"),
      ),
      body: ListView(
        children: [
          const AddressIdentifier(),
          Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: Text(
              "Способ оплаты",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          const PaymentType(),
          const PromoCode(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: leftPadding / 2),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: leftPadding / 2,
                vertical: 20,
              ),
              height: 300,
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 сум",
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 сум",
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "Бесплатно",
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 сум",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
