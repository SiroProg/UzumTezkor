import 'product_model.dart';
import 'promotion_model.dart';

class OrderModel {
  final int id;
  final String restaurant;
  final String deliveryPoint;
  final PromotionalCodeModel? promocode;
  final DateTime date;
  final bool isDelivered;
  final ProductModel product;
  final int amount;


  OrderModel({
    required this.id,
    required this.restaurant,
    required this.deliveryPoint,
    required this.promocode,
    required this.date,
    required this.isDelivered,
    required this.product,
    required this.amount,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          restaurant == other.restaurant &&
          deliveryPoint == other.deliveryPoint &&
          promocode == other.promocode &&
          date == other.date &&
          isDelivered == other.isDelivered &&
          product == other.product &&
          amount == other.amount;

  @override
  int get hashCode =>
      id.hashCode ^
      restaurant.hashCode ^
      deliveryPoint.hashCode ^
      promocode.hashCode ^
      date.hashCode ^
      isDelivered.hashCode ^
      product.hashCode ^
      amount.hashCode;

  @override
  String toString() {
    return 'OrderModel{'
        'id: $id, '
        'restaurant: $restaurant, '
        'deliveryPoint: $deliveryPoint, '
        'promocode: $promocode, '
        'date: $date, '
        'isDelivered: $isDelivered, '
        'product: $product, '
        'amount: $amount'
        '}';
  }
}
