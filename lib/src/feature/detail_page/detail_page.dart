import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';

class DetailPage extends ConsumerStatefulWidget {
  final RestaurantModel restaurant;

  const DetailPage({required this.restaurant, super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.blue,
            pinned: true,
            expandedHeight: 200,
            title: Text('Demo'),
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                // title: Text('Demo'),
                // expandedTitleScale: 2,
                // collapseMode: CollapseMode.pin,
                ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: widget.restaurant.products.keys.length,
              (context, index) => Column(
                children: [
                  Text(
                    widget.restaurant.products.keys.toList()[index].title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 10,
          //     (context, index) => Card(
          //       color: Colors.blue[100 * index],
          //       child: Center(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text("Grid - $index"),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ProductItem extends ConsumerStatefulWidget {
  const ProductItem({super.key});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
