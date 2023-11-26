import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/delivery_item.dart';

class DeliveryModal extends StatelessWidget {
  const DeliveryModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 10,
            top: 30,
            child: Text(
              "Стоимость доставки",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
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
          const Positioned(
            left: 20,
            top: 90,
            right: 10,
            child: DeliveryItem(
              leadingText: "До 99 000 сум",
              trailingText: "4 900 сум",
            ),
          ),
          const Positioned(
            left: 20,
            top: 140,
            right: 10,
            child: DeliveryItem(
              leadingText: "От 99 000 сум",
              trailingText: "Бесплатно",
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            top: 200,
            child: Text(
              "Детали",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 240,
            right: 10,
            child: DeliveryItem(
              leadingText: "Минималная сумма закаса",
              trailingText: "30 000 сум",
              bottomDivider: false,
            ),
          ),
        ],
      ),
    );
  }
}
