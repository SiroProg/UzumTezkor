import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/provider/person_state_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceLocation? _location =
        ref.watch(personProvider).locationList.firstOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Text(_location != null ? _location.address : ""),
      ),
    );
  }
}
