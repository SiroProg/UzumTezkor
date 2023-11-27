import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';

class OrderStateNotifier extends StateNotifier<OrderModel?> {
  OrderStateNotifier() : super(null);

  void setOrder(OrderModel orderModel) => state = orderModel;

  void setPlaceLocation({
    String? podezd,
    String? floor,
    String? flat,
    String? comment,
  }) {
  }
}

final orderNotifier = StateNotifierProvider<OrderStateNotifier, OrderModel?>(
  (ref) => OrderStateNotifier(),
);
