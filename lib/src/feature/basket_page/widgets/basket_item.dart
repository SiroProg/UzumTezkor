import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/detail_modal.dart';

class BasketItem extends ConsumerWidget {
  const BasketItem({
    required this.basketModel,
    super.key,
  });

  final BasketModel basketModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void detailModal() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return DetailModal(basketModel: basketModel);
        },
      );
    }

    return Column(
      children: [
        GestureDetector(
          onTap: detailModal,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.35),
              border: Border.all(color: Colors.black54.withOpacity(0.2)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(basketModel.productModel.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  bottom: 0,
                  left: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        basketModel.productModel.title,
                        maxLines: 2,
                        softWrap: true,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${basketModel.totalPrice} сум",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.deepPurple,
                                ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ref
                                .read(clientProvider.notifier)
                                .incrementBasketProduct(basketModel);
                          },
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${basketModel.amount}",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.deepPurple,
                                  ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(clientProvider.notifier)
                                .decrementBasketProduct(basketModel);
                          },
                          icon: Icon(
                            CupertinoIcons.minus,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
