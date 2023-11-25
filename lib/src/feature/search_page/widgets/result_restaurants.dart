import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/provider/client_state_notifier.dart';
import '../../home_page/widgets/restaurants.dart';

class ResultRestaurants extends ConsumerStatefulWidget {
  const ResultRestaurants({super.key});

  @override
  ConsumerState<ResultRestaurants> createState() => _ResultRestaurantsState();
}

class _ResultRestaurantsState extends ConsumerState<ResultRestaurants> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ref.watch(clientProvider.notifier).searchResults,
      builder: (BuildContext context, value, Widget? child) {
        return value.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: List.generate(
                    ref
                        .read(clientProvider.notifier)
                        .searchResults
                        .value
                        .length,
                    (index) => RestaurantItem(
                      restaurant: value[index],
                    ),
                  ),
                ),
              )
            : Text(
                "Ничего не найдено",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              );
      },
    );
  }
}
