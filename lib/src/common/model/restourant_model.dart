import 'product_model.dart';

class RestaurantModel {
  int id;
  String name;
  String poster;
  Map<Category, List<ProductModel>> products;
  DateTime open;
  DateTime close;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.poster,
    required this.products,
    required this.open,
    required this.close,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          poster == other.poster &&
          products == other.products &&
          open == other.open &&
          close == other.close;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      poster.hashCode ^
      products.hashCode ^
      open.hashCode ^
      close.hashCode;

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, poster: $poster, products: $products, open: $open, close: $close}';
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

