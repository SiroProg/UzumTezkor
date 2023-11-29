import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/order_page/order_page.dart';
import 'package:uzum_tezkor/src/feature/order_page/widgets/promocode_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/language.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/name_edit2.dart';

import '../../../common/localization/app_localizations.dart';
import '../../../common/provider/client_state_notifier.dart';
import 'custom_list_tile.dart';

class AccountExist extends ConsumerStatefulWidget {
  const AccountExist({super.key});

  @override
  ConsumerState<AccountExist> createState() => _AccountExistState();
}

class _AccountExistState extends ConsumerState<AccountExist> {
  @override
  void initState() {
    super.initState();
  }

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
            ValueListenableBuilder(
              valueListenable: $profileName,
              builder: (BuildContext context, String value, Widget? child) =>
                  ListTile(
                title: Text("${value} ", style: TextStyle(fontSize: 30)),
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
                function: () {
                  MaterialPageRoute(
                    builder: (ctx) => const PromoCode(),
                  );
                }),
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
                function: () => showDialog(
                      context: context,
                      builder: (context) {
                        // $profileName = '';
                        // $profileNumber = '';
                        // $profileIsExist = false;
                        // if (context.mounted) {
                        //   Navigator.pop(context);
                        // }
                        return AlertDialog(
                            title: Text(
                              "Chiqmoqchimisiz",
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  $profileName.value = '';
                                  $profileNumber = '';
                                  $profileIsExist = false;
                                  Navigator.pop(context);
                                  ref
                                      .read(clientProvider.notifier)
                                      .pageNumber
                                      .value = 0;

                                  ref
                                      .read(clientProvider.notifier)
                                      .pageController
                                      .jumpToPage(
                                        0,
                                      );
                                  ref.read(clientProvider.notifier).clear();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                    (route) => false,
                                  ); // Close the dialog
                                },
                                child: Text("Ha"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add your logout logic here
                                  // For example, you can clear user data and navigate to the login page

                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                  // Navigator.pushReplacementNamed(context, '/login'); // Replace with your login route
                                },
                                child: Text("Yo'q"),
                              )
                            ]);
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
