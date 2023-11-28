import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/info_tile_item.dart';

class PromoCode extends ConsumerStatefulWidget {
  const PromoCode({super.key});

  @override
  ConsumerState<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends ConsumerState<PromoCode> {
  final promoCodeController = TextEditingController();

  @override
  void dispose() {
    promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OrderModel order = ref.watch(orderNotifier)!;
    ValueNotifier<String> infoApply = ValueNotifier("");
    Color color = Colors.green;
    void applyPromoCode() {
      if (promoCodeController.text == order.promocode!.title) {
        infoApply.value = "${order.promocode!.title} успешно принимал";
        ref.read(orderNotifier.notifier).updateOrder(
              promoCodeActive: true,
            );
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
      } else {
        infoApply.value = "Но так промокод";
        color = Colors.red;
      }
    }

    void showDialogPromoCode() {
      showDialog(
          context: context,
          builder: (ctx) {
            return ValueListenableBuilder(
              valueListenable: infoApply,
              builder: (BuildContext context, String value, Widget? child) {
                return SimpleDialog(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Введите промокод",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: promoCodeController,
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: applyPromoCode,
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              foregroundColor:
                                  Theme.of(context).colorScheme.background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text("Применить"),
                          ),
                          if (value.isNotEmpty) const SizedBox(height: 5),
                          if (value.isNotEmpty)
                            Text(
                              value,
                              maxLines: 2,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: color,
                                  ),
                            ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Назад",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          });
    }

    return GestureDetector(
      onTap: showDialogPromoCode,
      child: InfoTileItem(
        icon: Icons.discount,
        subTitle: order.promocode!.isActive
            ? order.promocode!.title
            : 'Выберите или введите новый',
        title: order.promocode!.isActive
            ? "Скидка ${order.promocode!.discountAmount} %"
            : 'Эсть промокод?',
        isExistLeftIcon: true,
      ),
    );
  }
}
