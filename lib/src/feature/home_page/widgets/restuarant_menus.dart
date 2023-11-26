import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';

class ResturantMenus extends StatefulWidget {
  ResturantMenus({super.key, required this.currentRestaurant});

  RestaurantModel currentRestaurant;

  @override
  State<ResturantMenus> createState() => _ResturantMenusState();
}

class _ResturantMenusState extends State<ResturantMenus> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            actions: [
              Column(
                children: [
                  Row(
                    children: [
                      BackButton(color: Colors.white,),
                    ],
                  ),
                ],
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.currentRestaurant.poster,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.only(top: 70),
          //   sliver: SliverPersistentHeader(
          //     delegate: RestaurantCategories(
          //       onChanged: (value) {},
          //       selectedIndex: 0,
          //     ),
          //     pinned: true,
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((context, categoryIndex) {
          //     List<Menu> items = demoCategoryMenus[categoryIndex].items;
          //     return MenuCategoryItem(
          //       title: demoCategoryMenus[categoryIndex].category,
          //       items: List.generate(
          //         items.length,
          //         (index) => Menu(
          //           title: items[index].title,
          //           price: items[index].price,
          //           image: items[index].image,
          //         ),
          //       ),
          //     );
          //   }, childCount: demoCategoryMenus.length),
          // ),
        ],
      ),
    );
  }
}

// class RestaurantCategories extends SliverPersistentHeaderDelegate {
//   final ValueChanged<int> onChanged;
//   final int selectedIndex;
//
//   RestaurantCategories({required this.onChanged, required this.selectedIndex});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Categories(onChanged: onChanged, selextedIndex: selectedIndex);
//   }
//
//   @override
//   double get maxExtent => 56;
//
//   @override
//   double get minExtent => 56;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

// class Categories extends StatefulWidget {
//   const Categories(
//       {super.key, required this.onChanged, required this.selextedIndex});
//
//   final ValueChanged<int> onChanged;
//   final int selextedIndex;
//
//   @override
//   State<Categories> createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           demoCategoryMenus.length,
//           (index) => Padding(
//             padding: EdgeInsets.only(left: 8),
//             child: TextButton(
//               onPressed: () {},
//               style: TextButton.styleFrom(
//                 backgroundColor: widget.selextedIndex == index
//                     ? Colors.black
//                     : Colors.black45,
//               ),
//               child: Text(
//                 demoCategoryMenus[index].category,
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
