import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/custom_list_tile.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/registr_number.dart';

import 'language.dart';

class AccountNotExist extends StatelessWidget {
  const AccountNotExist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 18, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  AppLocalizations.of(context).profil,
                  style: TextStyle(fontSize: 35),
                ),
                const SizedBox(height: 35),
                CustomListTile(icon: Icons.chat, name: AppLocalizations.of(context).pomosh,function: (){}),
                CustomListTile(icon: Icons.language, name: AppLocalizations.of(context).til,function: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Language(),
                    ));}),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterNumber(),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child:  Center(
                  child: Text(
                    AppLocalizations.of(context).kirish,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
