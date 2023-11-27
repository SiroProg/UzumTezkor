import 'package:flutter/material.dart';

import 'widgets/account_exist.dart';
import 'widgets/account_not_exist.dart';

bool $profileIsExist = false;
String $profileName = "Azizbek";
String $profileNumber = "+998 50 002 07 13";
List<String> $profileNumberCode = ['0', '0', '0', '0'];


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return $profileIsExist ? AccountExist() : AccountNotExist();
  }
}
