import 'package:uzum_tezkor/src/common/model/basket_model.dart';

class PlaceLocation {
  final String id;
  final double longitude;
  final double latitude;
  final String address;
  final bool isSelected;
  final String podezd;
  final String floor;
  final String flat;
  final String comment;

  PlaceLocation({
    required this.longitude,
    required this.latitude,
    required this.address,
    this.podezd = '',
    this.floor = '',
    this.flat = '',
    this.comment = '',
    this.isSelected = true,
  }) : id = uuid.v4();

  PlaceLocation copyWith({
    double? longitude,
    double? latitude,
    String? address,
    bool? isSelected,
    String? podezd,
    String? floor,
    String? flat,
    String? comment,
  }) {
    return PlaceLocation(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      address: address ?? this.address,
      isSelected: isSelected ?? this.isSelected,
      podezd: podezd ?? this.podezd,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceLocation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          longitude == other.longitude &&
          latitude == other.latitude &&
          address == other.address &&
          isSelected == other.isSelected &&
          podezd == other.podezd &&
          floor == other.floor &&
          flat == other.flat &&
          comment == other.comment;

  @override
  int get hashCode =>
      id.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      address.hashCode ^
      isSelected.hashCode ^
      podezd.hashCode ^
      floor.hashCode ^
      flat.hashCode ^
      comment.hashCode;

  @override
  String toString() {
    return 'PlaceLocation'
        '{'
        'id: $id, '
        'longitude: $longitude, '
        'latitude: $latitude, '
        'address: $address, '
        'isSelected: $isSelected, '
        'podezd: $podezd, '
        'floor: $floor, '
        'flat: $flat, '
        'comment: $comment'
        '}';
  }
}
