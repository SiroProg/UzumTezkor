import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile_item.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/new_address.dart';

class AddressChooser extends ConsumerWidget {
  const AddressChooser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PlaceLocation> locationList = ref.watch(clientProvider).locationList;

    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            bottom: 30,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: locationList.length,
                    itemBuilder: (ctx, index) {
                      return AddressTileItem(
                        locationName: locationList[index].address,
                        isSelected: locationList[index].isSelected,
                      );
                    },
                  ),
                ),
                const NewAddress(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
