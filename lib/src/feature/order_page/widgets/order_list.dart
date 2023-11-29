import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uzum_tezkor/src/feature/order_page/widgets/order_info.dart';

import '../../../common/model/order_model.dart';

class OrderList extends StatelessWidget {
  const OrderList({required this.orders, super.key});

  final List<OrderModel> orders;

  String deliveryInfo(OrderModel order) {
    if (order.isDelivered) {
      return " .Доставлен";
    }
    int seconds = DateTime.now().difference(order.deliveredTime).inSeconds;
    String minute = ((seconds ~/ 60)).toString().padLeft(2, "0");
    String second =
        (seconds - ((seconds ~/ 60) * 60)).toString().padLeft(2, "0");
    return " $minute:$second осталос до доставлен";
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => OrderInfo(
                  order: orders[index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              ListTile(
                title: Text(
                  orders[index].restaurant.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                trailing: Text(
                  "${orders[index].totalPrice}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.deepPurple,
                      ),
                ),
                subtitle: Text(
                  "${DateFormat.yMMMMd('en_US').add_jm().format(
                        orders[index].date,
                      )} ${deliveryInfo(orders[index])}",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
