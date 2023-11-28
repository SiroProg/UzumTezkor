import 'package:uzum_tezkor/src/common/model/basket_model.dart';

class PromotionalCodeModel {
  final String id;
  final int discountAmount;
  final String title;
  final bool isActive;

  PromotionalCodeModel({
    required this.discountAmount,
    required this.title,
    this.isActive = false,
  }) : id = uuid.v4();

  PromotionalCodeModel copyWith({
    int? discountAmount,
    String? title,
    bool? isActive,
  }) {
    return PromotionalCodeModel(
      discountAmount: discountAmount ?? this.discountAmount,
      title: title ?? this.title,
      isActive: isActive ?? this.isActive,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionalCodeModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          discountAmount == other.discountAmount &&
          title == other.title &&
          isActive == other.isActive;

  @override
  int get hashCode =>
      id.hashCode ^
      discountAmount.hashCode ^
      title.hashCode ^
      isActive.hashCode;

  @override
  String toString() {
    return 'PromotionalCodeModel'
        '{'
        'id: $id, '
        'discountAmount: $discountAmount, '
        'title: $title, '
        'isActive: $isActive'
        '}';
  }
}
