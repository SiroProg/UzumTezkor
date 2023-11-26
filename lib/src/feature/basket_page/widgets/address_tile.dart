import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/client_model.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_chooser.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile_item.dart';

class AddressTile extends ConsumerWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ClientModel clientModel = ref.watch(clientProvider);
    PlaceLocation? location = clientModel.locationList.firstOrNull;
    String locationName =
        location == null ? "" : location.address.split(",").first;

    void showAddressModal() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const AddressChooser();
        },
      );
    }

    return GestureDetector(
      onTap: showAddressModal,
      child: AddressTileItem(
        locationName: locationName,
      ),
    );
  }
}
