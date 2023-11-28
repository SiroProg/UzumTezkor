import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/app.dart';

import 'src/common/provider/client_state_notifier.dart';

void main() async {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
