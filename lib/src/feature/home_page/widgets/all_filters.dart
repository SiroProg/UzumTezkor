import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

class AllFilters extends ConsumerStatefulWidget {
  const AllFilters({super.key});

  @override
  ConsumerState<AllFilters> createState() => _AllFiltersState();
}

class _AllFiltersState extends ConsumerState<AllFilters> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Фильтры",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 360,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: Category.values.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    ref.read(clientProvider.notifier).changeSelection(Category.values.toList()[index]);
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/images/mangal1.jpeg"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Text(
                        Category.values.toList()[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
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
    );
  }
}
