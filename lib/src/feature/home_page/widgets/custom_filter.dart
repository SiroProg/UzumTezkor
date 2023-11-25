import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/restourant_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

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
                (index) => GestureDetector(
                  child: FilterItem(
                    image: 'asset/images/hot${index + 1}.jpeg',
                    title: Category.values[index],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Padding(
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
                        "Еще",
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
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return GestureDetector(
          onTap: () {
            ref.read(clientProvider.notifier).changeSelection(widget.title);
            setState(() {});
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
                ref
                        .read(clientProvider.notifier)
                        .selectionCategoryes
                        .value[widget.title]!
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
              ],
            ),
          ),
        );
      },
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
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ValueListenableBuilder(
          valueListenable:
              ref.read(clientProvider.notifier).selectionCategoryes,
          builder: (BuildContext context, value, Widget? child) =>
              GestureDetector(
            onTap: () {

              ref.read(clientProvider.notifier).changeSelection(widget.title);
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: !ref
                            .watch(clientProvider.notifier)
                            .selectionCategoryes
                            .value[widget.title]!
                        ? Colors.deepPurple
                        : Colors.black12,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      widget.title.title,
                      style: TextStyle(
                        color: !ref
                                .watch(clientProvider.notifier)
                                .selectionCategoryes
                                .value[widget.title]!
                            ? Colors.white
                            : Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
