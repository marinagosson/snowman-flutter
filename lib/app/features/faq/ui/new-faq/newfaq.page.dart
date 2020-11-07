import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.widget.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:snowman/common/widgets/button.dart';
import 'package:snowman/common/widgets/text.dart';

class NewFAQPage extends StatefulWidget {
  @override
  _NewFAQPageState createState() => _NewFAQPageState();
}

class _NewFAQPageState extends State<NewFAQPage> with NewFAQWidget {
  final vm = inject<NewFAQViewModel>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: "Nova FAQ",
          color: colors.textAppBarCorlor,
        ),
      ),
      body: SingleChildScrollView(child: buildContainer(context, _scaffoldKey)),
    ));
  }
}
