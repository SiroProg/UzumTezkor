import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/feature/basket_page/basket_page.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';

import '../feature/registration_page/widgets/choice_language.dart';

class App extends StatefulWidget {
  App({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<App> createState() => _AppState();
}

ValueNotifier<Locale> $locale = ValueNotifier(Locale('uz'));

class _AppState extends State<App> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DaysOne').copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      title: "Uzum Tezkor",
      home: const ChoiceLanguage(),
    );
  }
}
