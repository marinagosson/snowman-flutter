import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/app/features/faq/ui/faqs/components/item_list.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.page.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/widgets/button.dart';
import 'package:snowman/common/widgets/text.dart';

class FAQsWidget {
  final vm = inject<FAQSViewModel>();

  Widget buildContainer(BuildContext context, GlobalKey<ScaffoldState> key) {
    return StreamBuilder<List<FAQ>>(
        stream: vm.streamListFAQs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: StreamBuilder(
                          stream: vm.streamExpandedList,
                          builder: (context, snapshot) {
                            return ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) => Divider(
                                height: 8,
                                color: Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(12),
                              itemBuilder: (ctx, index) {
                                return ItemList(vm.faqs[index],
                                    () => vm.setExpanded(index));
                              },
                              itemCount: vm.faqs.length,
                            );
                          })),
                  buildButton(context, key)
                ],
              );
            } else
              return Center(
                child: TextWidget(
                  text: "Nenhuma pergunta encontrada",
                ),
              );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }

  Widget buildButton(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 20),
      child: ButtonWidget(
        label: "Adicionar Pergunta",
        onPress: () async {
          final result = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewFAQPage()));
          if (result != null && result) vm.getAllFAQs();
        },
      ),
    );
  }
}
