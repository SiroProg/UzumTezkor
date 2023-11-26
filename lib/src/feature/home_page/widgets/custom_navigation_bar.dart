import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:badges/badges.dart' as badges;

import '../../basket_page/basket_page.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.onPageChange,
  });

  final void Function(int value) onPageChange;

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ref.watch(clientProvider.notifier).pageNumber,
      builder: (BuildContext context, value, Widget? child) => SizedBox(
        height: 70,
        child: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.black54,
          currentIndex: value,
          onTap: widget.onPageChange,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_outlined),
              label: 'Рестораны',
              activeIcon: Icon(Icons.restaurant_menu),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasketPage(),
                  ),
                ),
                child: badges.Badge(
                  badgeContent: Text(
                    ref.read(clientProvider).basket.length == 0
                        ? ""
                        : ref.read(clientProvider).basket.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.deepPurple,
                  ),
                  child: GestureDetector(
                    child: Icon(Icons.shopping_basket_outlined),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasketPage(),
                      ),
                    ),
                  ),
                ),
              ),
              // Icon(Icons.shopping_basket_outlined),
              label: 'Корзина',
              activeIcon: Icon(Icons.shopping_basket),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_bag),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Профиль',
              activeIcon: Icon(Icons.person_2),
            ),
          ],
        ),
      ),
    );
  }
}
