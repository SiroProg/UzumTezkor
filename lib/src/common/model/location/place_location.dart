import 'package:uzum_tezkor/src/common/model/basket_model.dart';

class PlaceLocation {
  final String id;
  final double longitude;
  final double latitude;
  final String address;
  final bool isSelected;

  PlaceLocation({
    required this.longitude,
    required this.latitude,
    required this.address,
    this.isSelected = true,
  }) : id = uuid.v4();

  PlaceLocation copyWith({
    double? longitude,
    double? latitude,
    String? address,
    bool? isSelected,
  }) {
    return PlaceLocation(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      address: address ?? this.address,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceLocation &&
          runtimeType == other.runtimeType &&
          longitude == other.longitude &&
          latitude == other.latitude &&
          address == other.address &&
          isSelected == other.isSelected;

  @override
  int get hashCode =>
      longitude.hashCode ^
      latitude.hashCode ^
      address.hashCode ^
      isSelected.hashCode;

  @override
  String toString() {
    return 'PlaceLocation'
        '{'
        'longitude: $longitude, '
        'latitude: $latitude, '
        'address: $address, '
        'isSelected: $isSelected'
        '}';
  }
}
