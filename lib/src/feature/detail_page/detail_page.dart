import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/product_model.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../common/provider/client_state_notifier.dart';

class DetailPage extends ConsumerStatefulWidget {
  final RestaurantModel restaurant;

  const DetailPage({required this.restaurant, super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage>
    with SingleTickerProviderStateMixin {
  late AutoScrollController autoScrollController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    autoScrollController = AutoScrollController();
    tabController = TabController(
        length: widget.restaurant.products.keys.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalScrollableTabView(
        autoScrollController: autoScrollController,
        tabController: tabController,
        listItemData: widget.restaurant.products.keys.toList(),
        eachItemChild: (aaa, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  widget.restaurant.products.keys.toList()[index].title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 15.0,
                  runSpacing: 15.0,
                  children: List.generate(
                    widget.restaurant.products.values.toList()[index].length,
                    (productIndex) => ProductItem(
                      product: widget.restaurant.products.values.toList()[index]
                          [productIndex],
                      restaurantModel: widget.restaurant,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            pinned: true,
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              onTap: VerticalScrollableTabBarStatus.setIndex,
              indicator: BoxDecoration(
                color: const Color(0xFFEFEEED),
                borderRadius: BorderRadius.circular(16),
              ),
              tabs: widget.restaurant.products.keys
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        e.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
            ),
            title: Column(
              children: [
                Text(
                  widget.restaurant.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "35-45 мин",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            centerTitle: true,
            stretch: true,
            collapsedHeight: 100,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            ],
            leading: BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(widget.restaurant.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends ConsumerStatefulWidget {
  final ProductModel product;
  final RestaurantModel restaurantModel;

  const ProductItem({
    super.key,
    required this.restaurantModel,
    required this.product,
  });

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  ValueNotifier<int> amount = ValueNotifier(1);

  void onButtonPressed() {
    ref.read(clientProvider).basket.add(
          BasketModel(
            productModel: widget.product,
            amount: amount.value,
            restaurantModel: widget.restaurantModel,
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 340,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.product.image,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  widget.product.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "${widget.product.price} сум",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  widget.product.compound,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.deepPurple.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            if (amount.value > 0) {
                              amount.value -= 1;
                            }
                          },
                          icon: Icon(
                            CupertinoIcons.minus,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                        // const SizedBox(width: 8),
                        ValueListenableBuilder(
                          valueListenable: amount,
                          builder: (ctx, value, child) {
                            return Text(
                              "$value",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.deepPurple,
                                  ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.deepPurple.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            amount.value += 1;
                          },
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: onButtonPressed,
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 15,
                          ),
                          backgroundColor: Colors.deepPurple,
                          foregroundColor:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Text("Добавить"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      child: SizedBox(
        width: 160,
        height: 230,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100, width: 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.product.image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 3),
                  child: Text(
                    widget.product.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.product.price} сум",
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 12),
                        ),
                        SizedBox(
                          width: 30,
                          height: 100,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
