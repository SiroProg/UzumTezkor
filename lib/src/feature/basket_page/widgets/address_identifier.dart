import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_tile.dart';

class AddressIdentifier extends ConsumerStatefulWidget {
  const AddressIdentifier({
    this.leftPadding = 20,
    super.key,
  });

  final double leftPadding;

  @override
  ConsumerState<AddressIdentifier> createState() => _AddressIdentifierState();
}

class _AddressIdentifierState extends ConsumerState<AddressIdentifier> {
  final podezdEditingController = TextEditingController();
  final floorEditingController = TextEditingController();
  final flatEditingController = TextEditingController();
  final commentEditingController = TextEditingController();

  @override
  void initState() {
    OrderModel orderModel = ref.watch(orderNotifier)!;
    podezdEditingController.text = orderModel.placeLocation.podezd;
    floorEditingController.text = orderModel.placeLocation.floor;
    flatEditingController.text = orderModel.placeLocation.flat;
    commentEditingController.text = orderModel.placeLocation.comment;
    super.initState();
  }

  @override
  void dispose() {
    podezdEditingController.dispose();
    floorEditingController.dispose();
    flatEditingController.dispose();
    commentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.leftPadding),
          child: Text(
            "Адрес доставки",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        const AddressTile(),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.leftPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: podezdEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Подьезд",
                        ),
                        onChanged: (value) {}),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: floorEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Этаж",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                        controller: flatEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Кв./Офис",
                        ),
                        onChanged: (value) {}),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: commentEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Комментарий для курьера",
                  ),
                  onChanged: (value) {}),
              const SizedBox(height: 8),
              const Divider(),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
