
class PromotionalCodeModel {
  int id;
  int discountAmount;
  String title;

  PromotionalCodeModel({
    required this.id,
    required this.discountAmount,
    required this.title,
  });

  @override
  String toString() {
    return 'PromotionalCode{id: $id, discountAmount: $discountAmount, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PromotionalCodeModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              discountAmount == other.discountAmount &&
              title == other.title;

  @override
  int get hashCode => id.hashCode ^ discountAmount.hashCode ^ title.hashCode;
}
