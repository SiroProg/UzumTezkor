import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/home_page/widgets/restuarant_menus.dart';

import '../../detail_page/detail_page.dart';

class Restaurants extends ConsumerStatefulWidget {
  const Restaurants({super.key});

  @override
  ConsumerState<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends ConsumerState<Restaurants> {
  @override
  void initState() {
    super.initState();
    ref.read(clientProvider.notifier).filterByCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).restorani,
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
          ValueListenableBuilder(
            valueListenable: ref.watch(clientProvider.notifier).restaurants,
            builder: (BuildContext context, value, Widget? child) {
              return Column(
                children: List.generate(
                  ref.read(clientProvider.notifier).restaurants.value.length,
                  (index) => RestaurantItem(
                    restaurant: value[index],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RestaurantItem extends ConsumerWidget {
  final RestaurantModel restaurant;

  const RestaurantItem({required this.restaurant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            restaurant: restaurant,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(restaurant.poster),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: SizedBox(
                    width: 210,
                    height: 35,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.deepPurple,
                              child: Icon(
                                Icons.delivery_dining,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of(context).bepulDostavka,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: 150,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "30 - 40 ${AppLocalizations.of(context).min}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              restaurant.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Text(
                  restaurant.products.keys.toList()[index].title,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Text(
                  " · ",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
