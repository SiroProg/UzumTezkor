class ProductModel {
  int id;
  int price;
  String title;
  String compound;
  String image;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.compound,
    required this.image,
  });

  @override
  String toString() {
    return 'ProductModel{id: $id, price: $price, title: $title, compound: $compound, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              price == other.price &&
              title == other.title &&
              compound == other.compound &&
              image == other.image;

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      title.hashCode ^
      compound.hashCode ^
      image.hashCode;
}
