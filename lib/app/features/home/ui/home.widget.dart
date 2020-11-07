import 'package:flutter/material.dart';
import 'package:snowman/common/widgets/button.dart';

class HomeWidget {
  Widget buildView(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      child: ButtonWidget(
        label: "Adicionar Pergunta",
      ),
    );
  }
}
