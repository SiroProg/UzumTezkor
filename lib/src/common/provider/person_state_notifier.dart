import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/data/fake_data.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/model/client_model.dart';

class LocationStateNotifier extends StateNotifier<ClientModel> {
  LocationStateNotifier() : super(FakeData().clientData.first);

  void setLocation(PlaceLocation location) async{
    state = state.copyWith(locationList: [location, ...state.locationList]);
    print(state);
  }
}

final personProvider =
    StateNotifierProvider<LocationStateNotifier, ClientModel>(
  (ref) => LocationStateNotifier(),
);
