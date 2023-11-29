import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/card_detail.dart';
import 'package:uzum_tezkor/src/common/model/order_model.dart';
import 'package:uzum_tezkor/src/common/model/person_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/common/provider/order_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/address_identifier.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/payment_type.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/total_order.dart';
import 'package:uzum_tezkor/src/feature/order_page/order_page.dart';

class Payment extends ConsumerStatefulWidget {
  const Payment({super.key});

  @override
  ConsumerState<Payment> createState() => _PaymentState();
}

class _PaymentState extends ConsumerState<Payment> {
  final codeEditingController = TextEditingController();
  ValueNotifier<String> infoApply = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    PersonModel? person = ref.watch(clientProvider).personModel;
    OrderModel order = ref.watch(orderNotifier)!;
    double leftPadding = 20;
    String enteredCardNumber = '';
    Color color = Colors.green;

    void applyCode(BuildContext ctxCodeModal) {
      if (codeEditingController.text == "2023") {
        int rnd = Random().nextInt(5);
        order = order.copyWith(
          personModel: person,
          date: DateTime.now(),
          deliveredTime: DateTime.now().add(
            Duration(minutes: rnd),
          ),
          cardDetail: CardDetail(
            cardNumber: enteredCardNumber,
            totalPrice: order.totalPrice,
          ),
        );
        ref.read(clientProvider.notifier).addOrder(order);
        infoApply.value = "Успешно выведены";
        color = Colors.green;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            ref.read(clientProvider.notifier).clearBasket();
            Navigator.of(ctxCodeModal).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const OrderPage(),
              ),
            );
          },
        );
      } else {
        infoApply.value = "Инвалид код";
        color = Colors.red;
      }
    }

    void applyCreditCard(BuildContext ctxModal) {
      final isValid = formKey.currentState!.validate();

      if (isValid) {
        Navigator.of(ctxModal).pop();
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
                            "Введите код",
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
                            controller: codeEditingController,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            onPressed: () {
                              applyCode(ctx);
                            },
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
          },
        );
      }
    }

    void showCardPaymentModal() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: 300,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Введиде карта номера",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.length == 16) {
                          return null;
                        }
                        return "Инвалид номера карта";
                      },
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value != null) {
                          enteredCardNumber = value;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        applyCreditCard(ctx);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        foregroundColor:
                            Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("Применить"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    void addOrder() {
      if (person == null) {
      } else {
        if (order.paymentType == PaymentTypeEnum.cash) {
          int rnd = Random().nextInt(15);
          order = order.copyWith(
            personModel: person,
            date: DateTime.now(),
            deliveredTime: DateTime.now().add(
              Duration(minutes: rnd),
            ),
          );
          ref.read(clientProvider.notifier).addOrder(order);
          ref.read(clientProvider.notifier).clearBasket();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const OrderPage(),
            ),
          );
        } else {
          showCardPaymentModal();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Оплата"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                const AddressIdentifier(),
                Padding(
                  padding: EdgeInsets.only(left: leftPadding),
                  child: Text(
                    "Способ оплаты",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                ),
                const PaymentType(),
                const PromoCode(),
                TotalOrder(leftPadding: leftPadding),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: leftPadding),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: addOrder,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text("Отправить заказ"),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
