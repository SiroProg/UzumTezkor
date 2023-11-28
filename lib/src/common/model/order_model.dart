import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/card_detail.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/model/person_model.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'promotion_model.dart';

enum PaymentTypeEnum {
  card("Картой", "UzCard, Humo, MasterCard, Visa"),
  cash("Наличами", "Наличний денги");

  final String type;
  final String description;

  const PaymentTypeEnum(this.type, this.description);
}

class OrderModel {
  final String id;
  final PersonModel? personModel;
  final RestaurantModel restaurant;
  final PlaceLocation placeLocation;
  final PromotionalCodeModel? promocode;
  final DateTime date;
  final DateTime deliveredTime;
  final bool isDelivered;
  final CardDetail? cardDetail;
  final List<BasketModel> products;
  final PaymentTypeEnum paymentType;

  OrderModel({
    required this.restaurant,
    required this.placeLocation,
    required this.date,
    required this.deliveredTime,
    required this.products,
    this.personModel,
    this.isDelivered = false,
    this.promocode,
    this.cardDetail,
    this.paymentType = PaymentTypeEnum.card,
  }) : id = uuid.v4();

  OrderModel copyWith({
    String? id,
    RestaurantModel? restaurant,
    PlaceLocation? placeLocation,
    PromotionalCodeModel? promocode,
    PersonModel? personModel,
    DateTime? date,
    DateTime? deliveredTime,
    bool? isDelivered,
    CardDetail? cardDetail,
    List<BasketModel>? products,
    PaymentTypeEnum? paymentType,
  }) {
    return OrderModel(
      personModel: personModel ?? this.personModel,
      restaurant: restaurant ?? this.restaurant,
      placeLocation: placeLocation ?? this.placeLocation,
      date: date ?? this.date,
      deliveredTime: deliveredTime ?? this.deliveredTime,
      isDelivered: isDelivered ?? this.isDelivered,
      products: products ?? this.products,
      promocode: promocode ?? this.promocode,
      cardDetail: cardDetail ?? this.cardDetail,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  String get deliveryPrice {
    if (productsTotal < 99000) {
      return "${restaurant.deliveryPriceToFree} сум";
    }
    return "Бесплатно";
  }

  double get productsTotal {
    double total = 0.0;
    for (BasketModel b in products) {
      total += b.totalPrice;
    }
    return total;
  }

  double get totalPrice {
    double total = 0.0;
    for (BasketModel b in products) {
      total += b.totalPrice;
    }
    if (total < 99000) {
      total += restaurant.deliveryPriceToFree;
    }
    total += restaurant.servicePrice;
    total -= getDiscount;

    return total;
  }

  double get getDiscount {
    if (promocode != null) {
      if (promocode!.isActive) {
        double total = 0.0;
        for (BasketModel b in products) {
          total += b.totalPrice;
        }
        if (total < 99000) {
          total += restaurant.deliveryPriceToFree;
        }
        total += restaurant.servicePrice;
        return (total * promocode!.discountAmount) / 100;
      }
    }
    return 0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          restaurant == other.restaurant &&
          placeLocation == other.placeLocation &&
          promocode == other.promocode &&
          date == other.date &&
          deliveredTime == other.deliveredTime &&
          isDelivered == other.isDelivered &&
          cardDetail == other.cardDetail &&
          products == other.products &&
          paymentType == other.paymentType;

  @override
  int get hashCode =>
      id.hashCode ^
      restaurant.hashCode ^
      placeLocation.hashCode ^
      promocode.hashCode ^
      date.hashCode ^
      deliveredTime.hashCode ^
      isDelivered.hashCode ^
      cardDetail.hashCode ^
      products.hashCode ^
      paymentType.hashCode;

  @override
  String toString() {
    return 'OrderModel'
        '{'
        'id: $id, '
        'placeLocation: $placeLocation, '
        'promocode: $promocode, '
        'date: $date, '
        'deliveredTime: $deliveredTime, '
        'isDelivered: $isDelivered, '
        'cardDetail: $cardDetail, '
        'products: $products, '
        'paymentType: $paymentType'
        '}';
  }
}
