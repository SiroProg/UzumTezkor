import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';

class BottomTotal extends ConsumerWidget {
  const BottomTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BasketModel> items = ref.watch(clientProvider).basket;

    double getTotalPrice() {
      double total = 0.0;
      for (BasketModel i in items) {
        total += i.totalPrice;
      }
      return total;
    }

    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black54.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.run_circle_outlined,
                  color: Colors.deepPurple,
                ),
                Text(
                  "Бесплатная доставка",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.deepPurple,
                      ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.deepPurple,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
              child: ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Center(
                    child: Text(
                      "${items.length}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.deepPurple,
                          ),
                    ),
                  ),
                ),
                title: Text(
                  "К оплате",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                trailing: Text(
                  "${getTotalPrice()} сум",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
