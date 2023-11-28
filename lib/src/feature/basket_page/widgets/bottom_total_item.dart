import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';

class BottomTotalItem extends StatelessWidget {
  const BottomTotalItem({
    required this.totalPrice,
    super.key,
  });

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    String text = AppLocalizations.of(context).bepulDostavka;
    IconData icon = Icons.run_circle_outlined;
    bool isBottomShown = false;
    double value = 1;
    double fontSize = 14;
    if (totalPrice < 30000) {
      text = "${30000 - totalPrice} ${AppLocalizations.of(context).sumDoMin}";
      icon = Icons.shopping_basket_outlined;
      value = totalPrice / 30000;
      fontSize = 12;
      isBottomShown = true;
    } else if (totalPrice < 99000) {
      icon = Icons.delivery_dining_outlined;
      text = "${99000 - totalPrice} ${AppLocalizations.of(context).sumDoBes}";
      isBottomShown = true;
      fontSize = 12;
      value = totalPrice / 99000;
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.deepPurple,
            ),
            Text(
              text,
              maxLines: 2,
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.deepPurple,
                    fontSize: fontSize,
                  ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.deepPurple,
            )
          ],
        ),
        if (isBottomShown) const SizedBox(height: 8),
        if (isBottomShown)
          LinearProgressIndicator(
            value: value,
            color: Colors.green,
          )
      ],
    );
  }
}
