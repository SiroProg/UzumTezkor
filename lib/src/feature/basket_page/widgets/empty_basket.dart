import 'package:flutter/material.dart';

class EmptyBasket extends StatelessWidget{
  const EmptyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "asset/images/no-basket.png",
            fit: BoxFit.cover,
            width: 300,
          ),
          const SizedBox(height: 15),
          Text(
            "Тут пусто",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Вернитесь назад и вқберите что-нибудь вкусное",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

}