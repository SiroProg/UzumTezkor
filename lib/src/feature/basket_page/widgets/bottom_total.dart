import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/bottom_total_item.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/delivery_modal.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/detail_modal.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment.dart';

class BottomTotal extends ConsumerWidget {
  const BottomTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BasketModel> items = ref.watch(clientProvider).basket;
    ValueNotifier<bool> isActive = ValueNotifier(false);
    PlaceLocation location = ref
        .read(clientProvider)
        .locationList
        .where((element) => element.isSelected)
        .first;
    RestaurantModel restaurantModel = items.first.restaurantModel;
    double getTotalPrice() {
      double total = 0.0;
      for (BasketModel i in items) {
        total += i.totalPrice;
      }
      if (total > 30000) isActive.value = true;
      return total;
    }

    void deliveryModal() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const DeliveryModal();
        },
      );
    }

    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black54.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: deliveryModal,
            child: BottomTotalItem(totalPrice: getTotalPrice()),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: getTotalPrice() >= 30000
                ? () {
                    ref.read(orderNotifier.notifier).setOrder(
                          OrderModel(
                            restaurant: restaurantModel,
                            placeLocation: location,
                            date: DateTime.now(),
                            deliveredTime: DateTime.now(),
                            products: items,
                          ),
                        );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const Payment(),
                      ),
                    );
                  }
                : null,
            child: ValueListenableBuilder(
              valueListenable: isActive,
              builder: (ctx, value, child) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: value
                        ? Colors.deepPurple
                        : Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.2),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Center(
                        child: Text(
                          "${items.length}",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                        ),
                      ),
                    ),
                    title: Text(
                      "К оплате",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                    trailing: Text(
                      "${getTotalPrice()} сум",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
