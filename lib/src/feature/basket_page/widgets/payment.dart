import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_identifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment_type.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/total_order.dart';

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
          TotalOrder(leftPadding: leftPadding),
        ],
      ),
    );
  }
}
