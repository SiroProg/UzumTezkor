import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/app.dart';

void main() {
  runApp(
     ProviderScope(
      child: App(),
    ),
  );
}
