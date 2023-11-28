import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../registration_page/widgets/determine_location.dart';

class NewAddress extends ConsumerWidget {
  const NewAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const DetermineLocation(isAddAddress: true),
              ),
            );
          },
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              "Новый адрес",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
