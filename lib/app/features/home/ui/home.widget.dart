import 'package:flutter/material.dart';
import 'package:snowman/app/features/home/ui/home.viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/widgets/button.dart';

class HomeWidget {
  final vm = inject<HomeViewModel>();

  Widget buildView(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      child: ButtonWidget(
        label: "Adicionar Pergunta",
      ),
    );
  }
}
