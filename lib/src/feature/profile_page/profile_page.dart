import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/model/person_model.dart';

import 'widgets/account_exist.dart';
import 'widgets/account_not_exist.dart';

bool $profileIsExist = false;
ValueNotifier<String> $profileName = ValueNotifier("");
String $profileNumber = "";
List<String> $profileNumberCode = ['0', '0', '0', '0'];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return $profileIsExist ? AccountExist() : AccountNotExist();
  }
}
