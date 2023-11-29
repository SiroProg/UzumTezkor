import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/basket_page/widgets/promo_code.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/order_page/order_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/language.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/name_edit.dart';

import '../../../common/localization/app_localizations.dart';
import 'custom_list_tile.dart';

class AccountExist extends StatelessWidget {
  const AccountExist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 12,
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text("${$profileName} ", style: TextStyle(fontSize: 30)),
              subtitle: Text("${$profileNumber}",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameEdit(),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 50),
            CustomListTile(
                icon: Icons.fact_check,
                name: AppLocalizations.of(context).istoriyaZakaz,
                function: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const OrderPage(),
                    ),
                  );
                }),
            CustomListTile(
                icon: CupertinoIcons.ticket_fill,
                name: AppLocalizations.of(context).promo,
                function: () {}),
            CustomListTile(
                icon: Icons.chat,
                name: AppLocalizations.of(context).pomosh,
                function: () {}),
            CustomListTile(
                icon: Icons.language,
                name: AppLocalizations.of(context).til,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(),
                      ));
                }),
            CustomListTile(
                icon: Icons.lock,
                name: AppLocalizations.of(context).politika,
                function: () {}),
            CustomListTile(
                icon: Icons.info,
                name: AppLocalizations.of(context).polzova,
                function: () {}),
            CustomListTile(
                icon: Icons.exit_to_app,
                name: AppLocalizations.of(context).chiqish,
                function: () {
                  $profileName = '';
                  $profileNumber = '';
                  $profileIsExist = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
