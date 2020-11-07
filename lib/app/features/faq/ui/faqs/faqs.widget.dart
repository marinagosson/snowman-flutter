import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.page.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/widgets/button.dart';
import 'package:snowman/common/widgets/text.dart';

class FAQsWidget {
  final vm = inject<FAQSViewModel>();

  Widget buildContainer(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return Card(
              child: Column(
                children: [
                  TextWidget(
                    text: "$index",
                  )
                ],
              ),
            );
          },
          itemCount: 10,
        )),
        buildButton(context, key)
      ],
    );
  }

  Widget buildButton(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 20),
      child: ButtonWidget(
        label: "Adicionar Pergunta",
        onPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewFAQPage()));
        },
      ),
    );
  }
}
