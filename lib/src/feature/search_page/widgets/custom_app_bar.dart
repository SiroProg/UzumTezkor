import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    ref.read(clientProvider.notifier).searchResults.value = [];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                width: 270,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          onChanged: (value) {
                            ref
                                .read(clientProvider.notifier)
                                .searchRestaurants(value);
                          },
                          decoration: InputDecoration(
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
                child: Text(
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
