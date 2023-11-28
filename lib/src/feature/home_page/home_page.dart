import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uzum_tezkor/src/feature/basket_page/basket_page.dart';
import 'package:uzum_tezkor/src/feature/home_page/widgets/custom_navigation_bar.dart';
import 'package:uzum_tezkor/src/feature/home_page/widgets/home_widgets.dart';
import 'package:uzum_tezkor/src/feature/order_page/order_page.dart';
import '../profile_page/profile_page.dart';
import 'widgets/custom_filter.dart';
import 'widgets/sliver_app_bar.dart';

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
    if (_scrollController.position.pixels.toInt() >= 280) {
      isVisible.value = true;
    } else if (isVisible.value &&
        _scrollController.position.pixels !=
            _scrollController.position.minScrollExtent) {
      isVisible.value = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    PlaceLocation? location =
        ref.watch(clientProvider).locationList.lastOrNull;
    final PageController pageController = PageController();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(
          onPageChange: (value) {
            ref.read(clientProvider.notifier).pageNumber.value = value;

            pageController.jumpToPage(
              value,
            );
          },
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            ref.read(clientProvider.notifier).pageNumber.value = value;
          },
          children: [
            Stack(
              children: [
                HomeWidgets(
                  pageController: _scrollController,
                  location: location,
                ),
                ValueListenableBuilder(
                  valueListenable: isVisible,
                  builder: (BuildContext context, value, Widget? child) =>
                      !isVisible.value
                          ? const SizedBox()
                          : PreferredSize(
                              preferredSize: const Size(double.infinity, 0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      AppBar(
                                        backgroundColor: Colors.white,
                                        actions: [
                                          ValueListenableBuilder(
                                            valueListenable: ref
                                                .watch(clientProvider.notifier)
                                                .counterOfFilters,
                                            builder: (BuildContext context,
                                                    value, Widget? child) =>
                                                badges.Badge(
                                              badgeContent: Text(
                                                value == 0
                                                    ? ""
                                                    : value.toString(),
                                              ),
                                              badgeStyle:
                                                  const badges.BadgeStyle(
                                                badgeColor: Colors.white,
                                              ),
                                              child: const Icon(CupertinoIcons
                                                  .slider_horizontal_3),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                        centerTitle: true,
                                        title: const Column(
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
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
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
                                      const Expanded(child: SizedBox()),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                              ref
                                                  .watch(
                                                      clientProvider.notifier)
                                                  .categories
                                                  .length,
                                              (index) => SliverFilterItem(
                                                title: ref
                                                    .watch(
                                                        clientProvider.notifier)
                                                    .categories[index],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: SizedBox(
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(50),
                                                      ),
                                                      color: Colors
                                                          .lightBlue.shade100,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
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
                                      const Expanded(child: SizedBox()),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
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
            const BasketPage(),
            const OrderPage(),
            const Profile(),
          ],
        ),
      ),
    );
  }
}
