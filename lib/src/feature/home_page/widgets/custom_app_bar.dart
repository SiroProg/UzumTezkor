import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

import '../../../common/localization/app_localizations.dart';

class CustomAppBar extends ConsumerWidget {
  final String location;

  const CustomAppBar({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        AppLocalizations.of(context).dom,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text(
                      " · ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        location,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: ref.watch(clientProvider.notifier).counterOfFilters,
            builder: (BuildContext context, value, Widget? child) =>
                badges.Badge(
              badgeContent: Text(
                value == 0 ? "" : value.toString(),
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.white,
              ),
              child: const Icon(CupertinoIcons.slider_horizontal_3),
            ),
          ),
        ],
      ),
    );
  }
}
