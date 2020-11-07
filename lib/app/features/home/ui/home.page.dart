import 'package:flutter/material.dart';
import 'package:snowman/app/features/home/ui/home.viewmodel.dart';
import 'package:snowman/app/features/home/ui/home.widget.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:snowman/common/widgets/text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeWidget {
  final vm = inject<HomeViewModel>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        centerTitle: true,
        title: TextWidget(
          text: "Perguntas Frequentes",
          color: colors.textAppBarCorlor,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: buildView(context, _scaffoldKey),
        ),
      ),
    ));
  }
}
