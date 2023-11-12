import 'package:flutter/material.dart';

import '../feature/registration_page/widgets/choice_language.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: "Uzum Tezkor",
      home: const ChoiceLanguage(),
    );
  }
}
