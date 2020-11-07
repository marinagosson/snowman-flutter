import 'dart:async';

import 'package:snowman/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:snowman/common/di/injector_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();
  setupInjection();
  return runZonedGuarded(() async {
    runApp(App());
  }, (error, stack) {
    print(error);
    print(stack);
  });
}
