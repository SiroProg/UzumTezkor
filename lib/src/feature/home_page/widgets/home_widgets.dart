import 'package:flutter/material.dart';

import '../../../common/model/location/place_location.dart';
import 'custom_app_bar.dart';
import 'custom_filter.dart';
import 'custom_poster.dart';
import 'custom_search.dart';
import 'restaurants.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({super.key, required this.pageController, required this.location});
  final ScrollController pageController;
  final PlaceLocation? location;

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        controller: widget.pageController,
        child: Column(
          children: [
            CustomAppBar(
              location: widget.location?.address.split(",").first ?? "",
            ),
            CustomPoster(),
            CustomSearch(),
            CustomFilter(),
            Restaurants(),
          ],
        ),
      ),
    );
  }
}
