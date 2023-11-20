import 'product_model.dart';
import 'promotion_model.dart';
import 'restourant_model.dart';

class OrderModel {
  int id;
  int paymentAmount;
  String restorant;
  String deliveryPoint;
  PromotionalCodeModel? promocode;
  DateTime date;
  bool isDelivered;
  List<ProductModel> ordersList;

  OrderModel({
    required this.id,
    required this.paymentAmount,
    required this.promocode,
    required this.deliveryPoint,
    required this.restorant,
    required this.date,
    required this.isDelivered,
    required this.ordersList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          paymentAmount == other.paymentAmount &&
          promocode == other.promocode &&
          date == other.date &&
          isDelivered == other.isDelivered &&
          ordersList == other.ordersList;

  @override
  int get hashCode =>
      id.hashCode ^
      paymentAmount.hashCode ^
      promocode.hashCode ^
      date.hashCode ^
      isDelivered.hashCode ^
      ordersList.hashCode;

  @override
  String toString() {
    return 'OrderModel{id: $id, paymentAmount: $paymentAmount, promocod: $promocode, date: $date, isDelivered: $isDelivered, ordersList: $ordersList}';
  }
}
