import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzum_tezkor/src/common/app.dart';

import 'src/common/provider/client_state_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  $preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
