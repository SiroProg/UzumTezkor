import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';

import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';

class DetermineLocation extends ConsumerStatefulWidget {
  const DetermineLocation({this.isAddAddress = false, Key? key})
      : super(key: key);
  final bool isAddAddress;

  @override
  ConsumerState<DetermineLocation> createState() => _DetermineLocationState();
}

class _DetermineLocationState extends ConsumerState<DetermineLocation> {
  Timer? _timer;

  final Completer<GoogleMapController> _controller = Completer();
  ValueNotifier<PlaceLocation?> location = ValueNotifier(null);

  void onCameraMove(CameraPosition cameraPosition) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () async {
      location.value = await ref.read(clientProvider.notifier).addressName(
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
          );
    });
  }

  @override
  void initState() {
    ref.read(clientProvider.notifier).getCurrentLocation(_controller);
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
          title: Text(
            AppLocalizations.of(context).yangiManzil,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).uliOrDom,
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
                        ref
                            .read(clientProvider.notifier)
                            .getCurrentLocation(_controller);
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
            ValueListenableBuilder(
                valueListenable: location,
                builder: (ctx, value, child) {
                  return Text(value?.address.split(",").firstOrNull ?? "");
                }),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                if (location.value != null) {
                  ref
                      .read(clientProvider.notifier)
                      .setLocation(location.value!);
                  if (widget.isAddAddress) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (ctx) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  }
                }
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
                AppLocalizations.of(context).lokatsiya,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
