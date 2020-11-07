import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/widgets/button.dart';
import 'package:snowman/common/widgets/input.dart';

class NewFAQWidget {
  final vm = inject<NewFAQViewModel>();

  Widget buildContainer(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  InputWidget(
                    labelText: "Titulo da pergunta",
                  ),
                  InputWidget(
                    labelText: "Resposta da pergunta",
                  ),
                ],
              ),
            ),
            ButtonWidget(
              label: "Adicionar",
            )
          ],
        ),
      ),
    );
  }
}
