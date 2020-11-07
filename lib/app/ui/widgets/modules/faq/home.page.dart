import 'package:flutter/material.dart';
import 'package:snowman/app/ui/widgets/modules/faq/home.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: buildView(context, _scaffoldKey),
        ),
      ),
    ));
  }
}
