import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/basket_items.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/bottom_total.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/empty_basket.dart';

class BasketPage extends ConsumerStatefulWidget {
  const BasketPage({super.key});

  @override
  ConsumerState<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends ConsumerState<BasketPage> {
  @override
  Widget build(BuildContext context) {
    List<BasketModel> items = ref.watch(clientProvider).basket;

    Widget content = const EmptyBasket();
    if (items.isNotEmpty) content = const BasketItems();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
         AppLocalizations.of(context).korzinka,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          if (items.isNotEmpty)
            IconButton(
              onPressed: () {
                ref.read(clientProvider.notifier).clearBasket();
              },
              icon: Icon(
                Icons.delete_outline,
                size: 30,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          if (items.isNotEmpty)
            Text(
              items.first.restaurantModel.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          Expanded(child: content),
          if (items.isNotEmpty) const BottomTotal(),
        ],
      ),
    );
  }
}
