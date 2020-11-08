import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.viewmodel.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/values/colors.dart';
import 'package:snowman/common/widgets/button.dart';
import 'package:snowman/common/widgets/input.dart';
import 'package:snowman/common/widgets/text.dart';

class NewFAQWidget {
  final vm = inject<NewFAQViewModel>();

  Widget buildContainer(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InputWidget(
                    labelText: "Título da pergunta",
                    autofocus: true,
                    onChange: (value) => vm.setQuestion(value),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InputWidget(
                    labelText: "Resposta da pergunta",
                    multiline: true,
                    maxLines: 4,
                    onChange: (value) => vm.setAnswer(value),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextWidget(
                    text: "Cor",
                    align: TextAlign.center,
                    color: labelInputColor,
                    bold: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: StreamBuilder<int>(
                        stream: vm.streamColor,
                        builder: (context, snapshot) {
                          final int currentColor =
                              snapshot.hasData ? snapshot.data : null;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () => vm.setColor(index),
                                  child: Container(
                                    width: 35.0,
                                    height: 35.0,
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: borderCircleColor)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color(vm.colors.elementAt(index)),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: currentColor != null &&
                                              vm.colors.elementAt(index) ==
                                                  currentColor
                                          ? Icon(
                                              Icons.check,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: vm.colors.length,
                            scrollDirection: Axis.horizontal,
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<ButtonState>(
                stream: vm.button,
                builder: (context, snapshot) {
                  final state =
                      snapshot.hasData ? snapshot.data : ButtonState.disable;
                  print('ButtonState: $state');
                  return ButtonWidget(
                    label: "Adicionar",
                    elevation: 0,
                    loading: state == ButtonState.loading,
                    onPress: state == ButtonState.loading
                        ? null
                        : (state == ButtonState.disable
                            ? null
                            : () async {
                                final result = await vm.save();
                                if (result) {
                                  key.currentState.showSnackBar(SnackBar(
                                      backgroundColor: appbarBackgroundColor,
                                      content: TextWidget(
                                        text: 'Item salvo com sucesso',
                                        bold: true,
                                        color: Colors.white,
                                      )));
                                  vm.clear();
                                  await Future.delayed(Duration(seconds: 2));
                                  Navigator.pop(context);
                                } else
                                  key.currentState.showSnackBar(SnackBar(
                                      content: TextWidget(
                                          text: 'Ops, ocorreu um erro.')));
                              }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
