import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
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
              AppLocalizations.of(context).filtr,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 320,
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
                    ref
                        .read(clientProvider.notifier)
                        .changeSelection(Category.values.toList()[index]);
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
                              image: AssetImage(index > 7
                                  ? "asset/images/desert${index - 3}.jpeg"
                                  : "asset/images/desert${index + 1}.jpeg"),
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
                      ValueListenableBuilder(
                        valueListenable: ref
                            .watch(clientProvider.notifier)
                            .selectionCategoryes[Category.values[index]]!,
                        builder: (BuildContext context, value, Widget? child) =>
                            ref
                                    .read(clientProvider.notifier)
                                    .selectionCategoryes[
                                        Category.values.toList()[index]]!
                                    .value
                                ? Text(
                                    Category.values.toList()[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  )
                                : DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        Category.values.toList()[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context).pokazat,
                  style: TextStyle(
                    color: Colors.white,
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
