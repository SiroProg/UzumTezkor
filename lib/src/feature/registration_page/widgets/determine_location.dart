import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart' as geo;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';

import '../../../common/model/location/place_location.dart';

class DetermineLocation extends StatefulWidget {
  const DetermineLocation({Key? key}) : super(key: key);

  @override
  State<DetermineLocation> createState() => _DetermineLocationState();
}

class _DetermineLocationState extends State<DetermineLocation> {
  String _currentAddress = "";
  double longitude = 0;
  double latitude = 0;
  PlaceLocation? _placeLocation;
  bool _isGettingLocation = true;

  Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;

  Future<void> _getCurrentLocation() async {
    var location = Location();
    try {
      LocationData userLocation = await location.getLocation();
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(userLocation.latitude!, userLocation.longitude!),
            zoom: 20,
          ),
        ),
      );
      latitude = userLocation.latitude!;
      longitude = userLocation.longitude!;
      _savePlace(latitude, longitude);
      setState(() {
        currentLocation = userLocation;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _savePlace(double latitude, double longitude) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyAMUS_eH_E0_qPzIuweJL_NWuRKoI8lj0w");
    final response = await get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final resData = jsonDecode(response.body);
      final formattedAddress = resData["results"][0]['formatted_address'];
      setState(() {
        _placeLocation = PlaceLocation(
          longitude: longitude,
          latitude: latitude,
          address: formattedAddress,
        );
        _isGettingLocation = false;
      });
      // widget.onChooseLocation(_locationModel!);
    } else {
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            style: ButtonStyle(
              iconSize: MaterialStateProperty.resolveWith((states) => 26),
            ),
          ),
          title: const Text(
            "Новый адрес",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Улица и дом",
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 480,
              child: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(41.311081, 69.240562),
                      zoom: 12,
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.location_on,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      onPressed: () {
                        _getCurrentLocation();
                      },
                      child: Transform.rotate(
                        angle: 44.5,
                        child: const Icon(
                          Icons.navigation_rounded,
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(_placeLocation?.address.split(',').firstOrNull ?? ""),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Подтвердите локацию",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
