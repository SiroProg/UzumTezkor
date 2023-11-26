import 'package:flutter/material.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    required this.leadingText,
    required this.trailingText,
    this.bottomDivider = true,
    super.key,
  });

  final String leadingText;
  final String trailingText;
  final bool bottomDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leadingText,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            Text(
              trailingText,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (bottomDivider) const Divider(),
      ],
    );
  }
}
