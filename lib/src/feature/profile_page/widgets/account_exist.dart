import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';

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
              trailing:
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: () {}),
            ),
            SizedBox(height: 50),
            CustomListTile(icon: Icons.fact_check, name: "Buyurtmalar tarixi"),
            CustomListTile(
                icon: CupertinoIcons.ticket_fill, name: "Promokodlar"),
            CustomListTile(icon: Icons.chat, name: "Yordam"),
            CustomListTile(icon: Icons.language, name: "Til"),
            CustomListTile(icon: Icons.lock, name: "Maxfiylik siyosati"),
            CustomListTile(
                icon: Icons.info, name: "Foydalanuvchi bilan kelishuv"),
            CustomListTile(icon: Icons.exit_to_app, name: "Chiqish"),
          ],
        ),
      ),
    );
  }
}
