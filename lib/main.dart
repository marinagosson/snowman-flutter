import 'dart:async';

import 'package:snowman/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/sources/database.helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();
  await DatabaseHelper.getInstance();
  return runZonedGuarded(() async {
    await setupInjection();
    runApp(App());
  }, (error, stack) {
    print(error);
    print(stack);
  });
}
