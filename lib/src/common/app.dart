import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/basket_page/basket_page.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DaysOne').copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      title: "Uzum Tezkor",
      home:  const HomePage(),
    );
  }
}
