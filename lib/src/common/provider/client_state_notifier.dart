import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:uzum_tezkor/src/common/data/fake_data.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/model/client_model.dart';

class ClientStateNotifier extends StateNotifier<ClientModel> {
  ClientStateNotifier() : super(FakeData().clientData.first);
  double? latitude;
  double? longitude;

  void setLocation(PlaceLocation location) async {
    state = state.copyWith(locationList: [location, ...state.locationList]);
    print(state);
  }

  Future<void> getCurrentLocation(
      Completer<GoogleMapController> controller) async {
    var location = Location();
    try {
      LocationData userLocation = await location.getLocation();
      final GoogleMapController mapController = await controller.future;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(userLocation.latitude!, userLocation.longitude!),
            zoom: 20,
          ),
        ),
      );
      latitude = userLocation.latitude!;
      longitude = userLocation.longitude!;
      await addressName(latitude!, longitude!);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<PlaceLocation?> addressName(double latitude, double longitude) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyAMUS_eH_E0_qPzIuweJL_NWuRKoI8lj0w");
    final response = await get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final resData = jsonDecode(response.body);
      final currentLocationName =
          resData["results"][0]['formatted_address'] as String;
      return PlaceLocation(
        longitude: longitude,
        latitude: latitude,
        address: currentLocationName,
      );
    }
    return null;
  }
}

final clientProvider = StateNotifierProvider<ClientStateNotifier, ClientModel>(
  (ref) => ClientStateNotifier(),
);
