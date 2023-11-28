import 'package:uuid/uuid.dart';
import 'package:uzum_tezkor/src/common/model/product_model.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';

const uuid = Uuid();

class BasketModel {
  final String id;
  final RestaurantModel restaurantModel;
  final ProductModel productModel;
  final int amount;

  BasketModel({
    required this.productModel,
    required this.amount,
    required this.restaurantModel,
  }) : id = uuid.v4();

  BasketModel copyWith({
    ProductModel? productModel,
    RestaurantModel? restaurantModel,
    int? amount,
  }) {
    return BasketModel(
      productModel: productModel ?? this.productModel,
      restaurantModel: restaurantModel ?? this.restaurantModel,
      amount: amount ?? this.amount,
    );
  }

  double get totalPrice =>
      double.tryParse((productModel.price * amount).toStringAsFixed(1)) ?? 0.0;

  @override
  String toString() {
    return 'BasketModel'
        '{'
        'id: $id, '
        'restaurantModel: $restaurantModel, '
        'productModel: $productModel, '
        'amount: $amount'
        '}';
  }
}
