import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    ref.read(clientProvider.notifier).searchResults.value = [];
  }

  void onTab(String value) {
    if (timer == null) {
      timer ==
          Timer(
            Duration(seconds: 2),
            () {
              ref.read(clientProvider.notifier).searchRestaurants(value);
              timer!.cancel();
              timer = null;
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: 270,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          autofocus: true,
                          onChanged: onTab,
                          decoration: const InputDecoration(
                            hintText: "Поиск",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Отменить",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 13),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
