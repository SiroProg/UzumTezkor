
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/model/restourant_model.dart';
import '../../../common/provider/client_state_notifier.dart';

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
          valueListenable: ref
              .watch(clientProvider.notifier)
              .selectionCategoryes[widget.title]!,
          builder: (BuildContext context, value, Widget? child) =>
              GestureDetector(
                onTap: () {
                  ref.read(clientProvider.notifier).changeSelection(widget.title);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: !ref
                            .watch(clientProvider.notifier)
                            .selectionCategoryes[widget.title]!
                            .value
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
                                .selectionCategoryes[widget.title]!
                                .value
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
