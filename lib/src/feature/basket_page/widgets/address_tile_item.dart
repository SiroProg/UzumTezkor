import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressTileItem extends ConsumerWidget {
  const AddressTileItem({
    required this.locationName,
    this.isSelected = false,
    super.key,
  });

  final String locationName;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color color = Theme.of(context).colorScheme.onPrimaryContainer;
    if (isSelected) {
      color = Colors.green;
    }
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withOpacity(0.2)),
            child: const Icon(
              Icons.home,
              size: 30,
              color: Colors.deepPurple,
            ),
          ),
          title: Text(
            "Uy",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: color,
                ),
          ),
          subtitle: Text(
            locationName,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: color,
                ),
          ),
          trailing: Icon(
            isSelected ? Icons.done : Icons.chevron_right,
            color: color,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
