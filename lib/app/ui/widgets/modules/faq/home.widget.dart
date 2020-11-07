import 'package:flutter/material.dart';
import 'package:snowman/app/ui/widgets/button.dart';

class HomeWidget {
  Widget buildView(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      child: ButtonWidget(
        label: "Adicionar Pergunta",
      ),
    );
  }
}
