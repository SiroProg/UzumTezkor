import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/provider/client_state_notifier.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';

import '../feature/registration_page/widgets/choice_language.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
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
      home: $preferences.getBool("isRegistered") ?? true
          ? const HomePage()
          : const ChoiceLanguage(),
    );
  }
}
