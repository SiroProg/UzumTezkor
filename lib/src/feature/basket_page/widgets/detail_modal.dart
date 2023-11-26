import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

class DetailModal extends ConsumerWidget {
  const DetailModal({
    required this.basketModel,
    super.key,
  });

  final BasketModel basketModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<int> amount = ValueNotifier(basketModel.amount);
    ValueNotifier<String> buttonText = ValueNotifier("Удалить");

    void setButtonText() {
      if (amount.value == 0 || amount.value == basketModel.amount) {
        buttonText.value = "Удалить";
      } else {
        buttonText.value = "Обновить";
      }
    }

    void onButtonPressed() {
      ref
          .read(clientProvider.notifier)
          .updateBasketElement(basketModel, amount.value);
      Navigator.of(context).pop();
    }

    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    basketModel.productModel.image,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.deepPurple.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            top: 260,
            child: Text(
              basketModel.productModel.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            top: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${basketModel.productModel.price} сум",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.deepPurple,
                      ),
                ),
                const SizedBox(height: 5),
                const Divider(),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            top: 340,
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
                          setButtonText();
                        }
                      },
                      icon: Icon(
                        CupertinoIcons.minus,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ValueListenableBuilder(
                      valueListenable: amount,
                      builder: (ctx, value, child) {
                        return Text(
                          "$value",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                        setButtonText();
                      },
                      icon: Icon(
                        CupertinoIcons.plus,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
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
                  child: ValueListenableBuilder(
                    valueListenable: buttonText,
                    builder: (ctx, value, child) {
                      return Text(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
