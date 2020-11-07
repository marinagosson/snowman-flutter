import 'dart:async';

import 'package:snowman/core/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();

  return runZonedGuarded(() async {
    runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
    ));
  }, (error, stack) {
    print(error);
    print(stack);
  });
}
