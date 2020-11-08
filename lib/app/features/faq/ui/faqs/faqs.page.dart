import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.widget.dart';
import 'package:snowman/common/di/injector_provider.dart';

class FAQsPage extends StatefulWidget {
  @override
  _FAQsPageState createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> with FAQsWidget {
  final vm = inject<FAQSViewModel>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    vm.getAllFAQs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [buildActionsAppBar(context)],
          title: buildTitleAppBar(context),
          centerTitle: true,
        ),
        body: SafeArea(
          child: buildContainer(context, _scaffoldKey),
        ));
  }
}
