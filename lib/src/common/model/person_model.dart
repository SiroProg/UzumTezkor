
import 'order_model.dart';
import 'product_model.dart';
import 'promotion_model.dart';

class PersonModel {
  int id;
  String name;
  String phoneNumber;
  List<OrderModel> ordersHistory;
  List<ProductModel> basket;
  List<PromotionalCodeModel> promotionalCodes;

  PersonModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.ordersHistory,
    required this.basket,
    required this.promotionalCodes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PersonModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              phoneNumber == other.phoneNumber &&
              ordersHistory == other.ordersHistory &&
              basket == other.basket &&
              promotionalCodes == other.promotionalCodes;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode ^
      ordersHistory.hashCode ^
      basket.hashCode ^
      promotionalCodes.hashCode;

  @override
  String toString() {
    return 'PersonModel{id: $id, name: $name, phoneNumber: $phoneNumber, ordersHistory: $ordersHistory, basket: $basket, promotionalCodes: $promotionalCodes}';
  }
}
