import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/custom_list_tile.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/registr_number.dart';

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
                const Text(
                  "Profil",
                  style: TextStyle(fontSize: 35),
                ),
                const SizedBox(height: 35),
                CustomListTile(icon: Icons.chat, name: "Yordam"),
                CustomListTile(icon: Icons.language, name: "Til"),
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
                child: const Center(
                  child: Text(
                    "Kirish/Registratsiya",
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
