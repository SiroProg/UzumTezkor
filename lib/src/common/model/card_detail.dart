import 'package:uzum_tezkor/src/common/model/basket_model.dart';

class CardDetail {
  final String id;
  final String cardNumber;
  final double totalPrice;
  final bool isPayed;

  CardDetail({
    required this.cardNumber,
    required this.totalPrice,
  })  : id = uuid.v4(),
        isPayed = false;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardDetail &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          cardNumber == other.cardNumber &&
          totalPrice == other.totalPrice &&
          isPayed == other.isPayed;

  @override
  int get hashCode =>
      id.hashCode ^
      cardNumber.hashCode ^
      totalPrice.hashCode ^
      isPayed.hashCode;

  @override
  String toString() {
    return 'CardDetail'
        '{'
        'id: $id, '
        'cardNumber: $cardNumber, '
        'totalPrice: $totalPrice, '
        'isPayed: $isPayed'
        '}';
  }
}
