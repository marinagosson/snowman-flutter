import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.widget.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:snowman/common/widgets/text.dart';

class FAQsPage extends StatefulWidget {
  @override
  _FAQsPageState createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> with FAQsWidget {
  final vm = inject<FAQSViewModel>();
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
          bold: true,
          color: colors.textAppBarCorlor,
        ),
      ),
      body: buildContainer(context, _scaffoldKey),
    ));
  }
}
