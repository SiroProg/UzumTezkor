import 'package:flutter/material.dart';

import '../../../common/model/order_model.dart';

class OrderList extends StatelessWidget {
  const OrderList({required this.orders, super.key});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(itemBuilder: (ctx, index) {

    });
  }
}
