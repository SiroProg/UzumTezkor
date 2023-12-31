import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzum_tezkor/src/common/app.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';

import 'sms_code.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isUzbekSelected = false;
  bool isRussianSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Colors.black,
                  ),
                  Text(
                    "Til",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
          Column(
            children: [
              CheckboxListTile(
                title: Text("O'zbekcha"),
                value: isUzbekSelected,
                onChanged: (value) {
                  App.setLocale(context, Locale("uz"));
                  isUzbekSelected = value!;
                  isRussianSelected = !value;
                  setState(() {});
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              CheckboxListTile(
                  title: Text('Русский'),
                  value: isRussianSelected,
                  onChanged: (value) {
                    App.setLocale(context, Locale("ru"));
                    isRussianSelected = value!;
                    isUzbekSelected = !value;
                    setState(() {});
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
