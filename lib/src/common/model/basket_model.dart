import 'package:uuid/uuid.dart';
import 'package:uzum_tezkor/src/common/model/product_model.dart';

const uuid = Uuid();

class BasketModel {
  final String id;
  final ProductModel productModel;
  final int amount;

  BasketModel({
    required this.productModel,
    required this.amount,
  }) : id = uuid.v4();

  BasketModel copyWith({
    ProductModel? productModel,
    int? amount,
  }) {
    return BasketModel(
      productModel: productModel ?? this.productModel,
      amount: amount ?? this.amount,
    );
  }

  double get totalPrice =>
      double.tryParse((productModel.price * amount).toStringAsFixed(1)) ?? 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketModel &&
          runtimeType == other.runtimeType &&
          productModel == other.productModel &&
          amount == other.amount;

  @override
  int get hashCode => productModel.hashCode ^ amount.hashCode;

  @override
  String toString() {
    return 'BasketModel'
        '{'
        'productModel: $productModel, '
        'amount: $amount'
        '}';
  }
}
