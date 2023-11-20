import 'package:uzum_tezkor/src/common/model/person_model.dart';
import 'package:uzum_tezkor/src/common/model/product_model.dart';
import 'package:uzum_tezkor/src/common/model/promotion_model.dart';

import 'location/place_location.dart';
import 'order_model.dart';

class ClientModel {
  PersonModel? personModel;
  final List<OrderModel> ordersHistory;
  final List<ProductModel> basket;
  final List<PromotionalCodeModel> promotionalCodes;
  final List<PlaceLocation> locationList;

  ClientModel({
    required this.ordersHistory,
    required this.basket,
    required this.promotionalCodes,
    required this.locationList,
    this.personModel,
  });

  ClientModel copyWith({
    PersonModel? personModel,
    List<OrderModel>? ordersHistory,
    List<ProductModel>? basket,
    List<PromotionalCodeModel>? promotionalCodes,
    List<PlaceLocation>? locationList,
  }) {
    return ClientModel(
      personModel: personModel ?? this.personModel,
      ordersHistory: ordersHistory ?? this.ordersHistory,
      basket: basket ?? this.basket,
      promotionalCodes: promotionalCodes ?? this.promotionalCodes,
      locationList: locationList ?? this.locationList,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientModel &&
          runtimeType == other.runtimeType &&
          personModel == other.personModel &&
          ordersHistory == other.ordersHistory &&
          basket == other.basket &&
          promotionalCodes == other.promotionalCodes &&
          locationList == other.locationList;

  @override
  int get hashCode =>
      personModel.hashCode ^
      ordersHistory.hashCode ^
      basket.hashCode ^
      promotionalCodes.hashCode ^
      locationList.hashCode;

  @override
  String toString() {
    return 'ClientModel{'
        'personModel: $personModel, '
        'ordersHistory: $ordersHistory, '
        'basket: $basket, '
        'promotionalCodes: $promotionalCodes, '
        'locationList: $locationList'
        '}';
  }
}
