import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:uzum_tezkor/src/common/provider/person_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';

import '../../../common/model/location/place_location.dart';

class DetermineLocation extends ConsumerStatefulWidget {
  const DetermineLocation({Key? key}) : super(key: key);

  @override
  ConsumerState<DetermineLocation> createState() => _DetermineLocationState();
}

class _DetermineLocationState extends ConsumerState<DetermineLocation> {
  double longitude = 0;
  double latitude = 0;
  PlaceLocation? _placeLocation;
  Timer? _timer;

  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;

  void onCameraMove(CameraPosition cameraPosition) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      _savePlace(
          cameraPosition.target.latitude, cameraPosition.target.longitude);
    });
  }

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
      final formattedAddress =
          resData["results"][0]['formatted_address'] as String;
      _placeLocation = PlaceLocation(
        longitude: longitude,
        latitude: latitude,
        address: formattedAddress.split(",").firstOrNull ?? "",
      );
      ref.read(personProvider.notifier).setLocation(_placeLocation!);
    }
  }

  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _placeLocation = ref.watch(personProvider).locationList.firstOrNull;
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
              height: 500,
              child: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    onCameraMove: onCameraMove,
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
            const SizedBox(
              height: 20,
            ),
            Text(_placeLocation?.address ?? ""),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const HomePage(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Подтвердите локацию",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                "Уточнить адрес",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
