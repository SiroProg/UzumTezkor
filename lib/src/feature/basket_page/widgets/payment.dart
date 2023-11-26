import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile.dart';

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
          Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: Text(
              "Адрес доставки",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          const AddressTile(),
        ],
      ),
    );
  }
}
