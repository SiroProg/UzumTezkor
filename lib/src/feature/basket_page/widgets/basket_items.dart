import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/basket_item.dart';

class BasketItems extends ConsumerWidget {
  const BasketItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BasketModel> items = ref.watch(clientProvider).basket;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (value) {
              ref
                  .read(clientProvider.notifier)
                  .removeBasketElement(items[index]);
            },
            key: ValueKey(items[index].id),
            child: BasketItem(
              basketModel: items[index],
            ),
          );
        },
      ),
    );
  }
}
