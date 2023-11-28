import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/model/person_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/order_page/widgets/empty_order.dart';
import 'package:uzum_tezkor/src/feature/order_page/widgets/order_list.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PersonModel? person = ref.watch(clientProvider).personModel;
    late final List<OrderModel> orders;
    if (person != null) {
      orders = ref
          .watch(clientProvider)
          .ordersHistory
          .where((element) => element.personModel!.id == person.id)
          .toList();
    } else {
      orders = [];
    }
    Widget content = const EmptyOrder();
    if (orders.isNotEmpty) content = OrderList(orders: orders);
    return Scaffold(
      appBar: orders.isNotEmpty
          ? AppBar(
              title: const Text("Заказы"),
            )
          : null,
      body: content,
    );
  }
}
