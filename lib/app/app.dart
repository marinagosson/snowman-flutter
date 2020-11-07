import 'package:snowman/app/features/faq/ui/faqs/faqs.page.dart';
import 'package:snowman/common/values/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false, theme: appTheme, home: FAQsPage());
}
