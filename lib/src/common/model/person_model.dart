import 'package:uzum_tezkor/src/common/model/location/place_location.dart';

import 'order_model.dart';
import 'product_model.dart';
import 'promotion_model.dart';

class PersonModel {
  final int id;
  final String name;
  final String phoneNumber;
  final List<OrderModel> ordersHistory;
  final List<ProductModel> basket;
  final List<PromotionalCodeModel> promotionalCodes;
  final List<PlaceLocation> locationList;

  const PersonModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.ordersHistory,
    required this.basket,
    required this.promotionalCodes,
    required this.locationList,
  });

  PersonModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    List<OrderModel>? ordersHistory,
    List<ProductModel>? basket,
    List<PromotionalCodeModel>? promotionalCodes,
    List<PlaceLocation>? locationList,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      ordersHistory: ordersHistory ?? this.ordersHistory,
      basket: basket ?? this.basket,
      promotionalCodes: promotionalCodes ?? this.promotionalCodes,
      locationList: locationList ?? this.locationList,
    );
  }

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
    return 'PersonModel{'
        'id: $id, '
        'name: $name, '
        'phoneNumber: $phoneNumber, '
        'ordersHistory: $ordersHistory, '
        'basket: $basket, '
        'promotionalCodes: $promotionalCodes, '
        'locationList: $locationList'
        '}';
  }
}
