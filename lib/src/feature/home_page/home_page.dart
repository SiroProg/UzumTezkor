import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:badges/badges.dart' as badges;
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_filter.dart';
import 'widgets/custom_poster.dart';
import 'widgets/custom_search.dart';
import 'widgets/restaurants.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePagState();
}

class _HomePagState extends ConsumerState<HomePage> {
  late final ScrollController _scrollController;
  ValueNotifier<bool> isVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(onChange);
  }

  void onChange() {
    if (_scrollController.position.pixels.toInt() >= 150) {
      isVisible.value = true;
    } else if (isVisible.value &&
        _scrollController.position.pixels !=
            _scrollController.position.minScrollExtent) {
      isVisible.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    PlaceLocation? location =
        ref.watch(clientProvider).locationList.firstOrNull;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    CustomAppBar(
                      location: location?.address.split(",").first ?? "",
                    ),
                    CustomPoster(),
                    CustomSearch(),
                    CustomFilter(),
                    Restaurants(),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isVisible,
              builder: (BuildContext context, value, Widget? child) =>
                  !isVisible.value
                      ? SizedBox()
                      : PreferredSize(
                          preferredSize: Size(double.infinity, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppBar(
                                    backgroundColor: Colors.white,
                                    actions: [
                                      ValueListenableBuilder(
                                        valueListenable: ref
                                            .watch(clientProvider.notifier)
                                            .counterOfFilters,
                                        builder: (BuildContext context, value,
                                                Widget? child) =>
                                            badges.Badge(
                                          badgeContent: Text(
                                            value == 0 ? "" : value.toString(),
                                          ),
                                          badgeStyle: badges.BadgeStyle(
                                            badgeColor: Colors.white,
                                          ),
                                          child: Icon(CupertinoIcons
                                              .slider_horizontal_3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                    centerTitle: true,
                                    title: Column(
                                      children: [
                                        Text(
                                          "Рестораны",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "улица Беруний 3А",
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 2,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                          ref
                                              .watch(clientProvider.notifier)
                                              .categories
                                              .length,
                                          (index) => SliverFilterItem(
                                            title: ref
                                                .watch(clientProvider.notifier)
                                                .categories[index],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: SizedBox(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  ),
                                                  color:
                                                      Colors.lightBlue.shade100,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  child: Text(
                                                    "Еще",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 2,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverFilterItem extends ConsumerStatefulWidget {
  final Category title;

  const SliverFilterItem({
    required this.title,
    super.key,
  });

  @override
  ConsumerState<SliverFilterItem> createState() => _SliverFilterItemState();
}

class _SliverFilterItemState extends ConsumerState<SliverFilterItem> {
  ValueNotifier<bool> isSelected = ValueNotifier(false);

  void changeSelection() => isSelected.value = ref
      .read(clientProvider.notifier)
      .selectionCategoryes
      .value[Category.values.indexOf(widget.title)];

  @override
  void initState() {
    super.initState();
    changeSelection();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(clientProvider.notifier)
          ..refreshFilterList(widget.title)
          ..filterByCategories();
        ref.read(clientProvider.notifier).changeSelection(widget.title);
        changeSelection();
      },
      child: ValueListenableBuilder(
        valueListenable: isSelected,
        builder: (BuildContext context, bool value, Widget? child) => Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: isSelected.value ? Colors.deepPurple : Colors.black12,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  widget.title.title,
                  style: TextStyle(
                    color: isSelected.value ? Colors.white : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
