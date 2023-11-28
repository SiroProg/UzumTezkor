import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';
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
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: locationList.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(clientProvider.notifier)
                              .setAsMainAddress(locationList[index]);
                          Navigator.of(context).pop();
                        },
                        child: InfoTileItem(
                          subTitle: locationList[index].address,
                          isSelected: locationList[index].isSelected,
                        ),
                      );
                    },
                  ),
                ),
                const NewAddress(),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.deepPurple.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
