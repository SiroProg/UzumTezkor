import 'product_model.dart';

class RestaurantModel {
  final int id;
  final String name;
  final String poster;
  final Map<Category, List<ProductModel>> products;
  final double servicePrice;
  final double deliveryPriceToFree;
  final DateTime open;
  final DateTime close;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.poster,
    required this.products,
    required this.open,
    required this.close,
    required this.servicePrice,
    required this.deliveryPriceToFree,
  });

  RestaurantModel copyWith(
    int? id,
    String? name,
    String? poster,
    Map<Category, List<ProductModel>>? products,
    double? servicePrice,
    double? deliveryPriceToFree,
    DateTime? open,
    DateTime? close,
  ) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      poster: poster ?? this.poster,
      products: products ?? this.products,
      open: open ?? this.open,
      close: close ?? this.close,
      servicePrice: servicePrice ?? this.servicePrice,
      deliveryPriceToFree: deliveryPriceToFree ?? this.deliveryPriceToFree,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          poster == other.poster &&
          products == other.products &&
          servicePrice == other.servicePrice &&
          deliveryPriceToFree == other.deliveryPriceToFree &&
          open == other.open &&
          close == other.close;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      poster.hashCode ^
      products.hashCode ^
      servicePrice.hashCode ^
      deliveryPriceToFree.hashCode ^
      open.hashCode ^
      close.hashCode;

  @override
  String toString() {
    return 'RestaurantModel'
        '{'
        'id: $id, '
        'name: $name, '
        'poster: $poster, '
        'products: $products, '
        'servicePrice: $servicePrice, '
        'deliveryPriceToFree: $deliveryPriceToFree, '
        'open: $open, '
        'close: $close'
        '}';
  }
}

enum Category {
  pita('Лаваш'),
  burger('Бургеры'),
  chicken('Курочка'),
  dessert('Десерты'),
  asia('Азия'),
  coffee('Кофе'),
  pilaf('Плов'),
  kebab('Шашлыки'),
  nationalFood('Национальная еда'),
  pizza('Пицца');

  const Category(this.title);

  final String title;
}
