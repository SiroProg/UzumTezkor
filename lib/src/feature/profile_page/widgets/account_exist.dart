import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/language.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/name_edit.dart';

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
              title: Text("${$profileName}", style: TextStyle(fontSize: 30)),
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
                name: "Buyurtmalar tarixi",
                function: () {}),
            CustomListTile(
                icon: CupertinoIcons.ticket_fill,
                name: "Promokodlar",
                function: () {}),
            CustomListTile(icon: Icons.chat, name: "Yordam", function: () {}),
            CustomListTile(icon: Icons.language, name: "Til", function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Language(),
                  ));
            }),
            CustomListTile(
                icon: Icons.lock, name: "Maxfiylik siyosati", function: () {}),
            CustomListTile(
                icon: Icons.info,
                name: "Foydalanuvchi bilan kelishuv",
                function: () {}),
            CustomListTile(
                icon: Icons.exit_to_app,
                name: "Chiqish",
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
