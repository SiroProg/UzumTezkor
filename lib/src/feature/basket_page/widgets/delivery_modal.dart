import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/delivery_item.dart';

import '../../../common/localization/app_localizations.dart';

class DeliveryModal extends ConsumerWidget {
  const DeliveryModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderModel orderModel = ref.watch(orderNotifier)!;
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 10,
            top: 30,
            child: Text(
              AppLocalizations.of(context).stomoist,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.deepPurple.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 90,
            right: 10,
            child: DeliveryItem(
              leadingText: AppLocalizations.of(context).do99000,
              trailingText:
                  "${orderModel.restaurant.deliveryPriceToFree} ${AppLocalizations.of(context).sum}",
            ),
          ),
          Positioned(
            left: 20,
            top: 140,
            right: 10,
            child: DeliveryItem(
              leadingText: AppLocalizations.of(context).ot99000,
              trailingText: AppLocalizations.of(context).bepul,
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            top: 200,
            child: Text(
              AppLocalizations.of(context).detail,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          Positioned(
            left: 20,
            top: 240,
            right: 10,
            child: DeliveryItem(
              leadingText: AppLocalizations.of(context).miniSumZakaz,
              trailingText: AppLocalizations.of(context).s30000,
              bottomDivider: false,
            ),
          ),
        ],
      ),
    );
  }
}
