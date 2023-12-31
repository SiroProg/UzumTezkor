import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';

import '../../../common/provider/client_state_notifier.dart';

class CustomFilter extends ConsumerStatefulWidget {
  const CustomFilter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomFilterState();
}

class _CustomFilterState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: double.infinity,
        height: 110,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                8,
                (index) => FilterItem(
                  image: 'asset/images/hot${index + 1}.jpeg',
                  title: Category.values[index],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 38,
                        child: Icon(Icons.arrow_forward, size: 30),
                      ),
                      SizedBox(height: 6),
                      Text(
                        AppLocalizations.of(context).yeshyo,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterItem extends ConsumerStatefulWidget {
  final String image;
  final Category title;

  const FilterItem({super.key, required this.image, required this.title});

  @override
  ConsumerState<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends ConsumerState<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, Widget? child) {
        return GestureDetector(
          onTap: () {
            ref.read(clientProvider.notifier).changeSelection(widget.title);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.image),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                ValueListenableBuilder(
                  valueListenable: ref
                      .watch(clientProvider.notifier)
                      .selectionCategoryes[widget.title]!,
                  builder: (BuildContext context, value, Widget? child) => ref
                          .read(clientProvider.notifier)
                          .selectionCategoryes[widget.title]!
                          .value
                      ? Text(
                          widget.title.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      : SizedBox(
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              child: Text(
                                widget.title.title,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
