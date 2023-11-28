import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_identifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment_type.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';

import '../../../common/localization/app_localizations.dart';

class Payment extends ConsumerWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderModel orderModel = ref.watch(orderNotifier)!;
    double leftPadding = 20;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).oplata),
      ),
      body: ListView(
        children: [
          const AddressIdentifier(),
          Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: Text(
              AppLocalizations.of(context).spoOplata,
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
                        AppLocalizations.of(context).kOplate,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 ${AppLocalizations.of(context).sum}",
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
                        AppLocalizations.of(context).zakaz,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 ${AppLocalizations.of(context).sum}",
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
                        AppLocalizations.of(context).dostavka,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        AppLocalizations.of(context).bepul,
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
                        AppLocalizations.of(context).rabotaSer,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w200,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                      Text(
                        "339 000 ${AppLocalizations.of(context).sum}",
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
