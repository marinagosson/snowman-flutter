import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/app/features/faq/ui/faqs/components/item_list.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.page.dart';
import 'package:snowman/common/di/injector_provider.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:snowman/common/values/colors.dart';
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

  StreamBuilder buildActionsAppBar(BuildContext context) {
    return StreamBuilder(
        stream: vm.toolbarSearch,
        builder: (context, snapshot) {
          bool isVisibleSearch = false;
          if (snapshot.hasData) isVisibleSearch = snapshot.data;

          if (isVisibleSearch) {
            return SizedBox(width: 32);
          }

          return IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => vm.startedSearch(),
          );
        });
  }

  StreamBuilder buildTitleAppBar(BuildContext context) {
    return StreamBuilder(
        stream: vm.toolbarSearch,
        builder: (context, snapshot) {
          bool isVisibleSearch = false;
          if (snapshot.hasData && snapshot.data)
            isVisibleSearch = snapshot.data;
          print('visible: search');
          return isVisibleSearch
              ? buildSearchField(context)
              : TextWidget(
                  text: "Perguntas Frequentes",
                  bold: true,
                  color: colors.textAppBarColor,
                );
        });
  }

  void clearSearchQuery() {
    vm.searchQueryController.clear();
    vm.setQuerySearch("");
  }

  void stopSearching() {
    vm.setQuerySearch("");
    vm.stopSearch();
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: vm.stopSearch()));
    // vm.getStartedSearch();
  }

  StreamBuilder buildLeadingAppBar(BuildContext context) {
    return StreamBuilder(
        stream: vm.toolbarSearch,
        builder: (context, snapshot) {
          bool isVisibleSearch = false;
          if (snapshot.hasData) isVisibleSearch = snapshot.data;
          return isVisibleSearch
              ? buildClearSearch(context)
              : const SizedBox.shrink();
        });
  }

  IconButton buildClearSearch(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        vm.setQuerySearch("");
        Navigator.pop(context);
      },
    );
  }

  buildSearchField(BuildContext context) {
    return TextField(
      maxLines: 1,
      textAlign: TextAlign.start,
      controller: vm.searchQueryController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          fillColor: Colors.indigo[700],
          filled: true,
          hintText: 'Procurar pergunta ...',
          hintStyle: const TextStyle(color: Colors.white70),
          suffixText: "|",
          labelStyle: TextStyle(color: Colors.white70),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: IconButton(
              icon: Icon(Icons.close),
              color: Colors.white70,
              onPressed: () => stopSearching(),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: Icon(
              Icons.search,
              color: Colors.white70,
            ),
          )),
      autofocus: true,
      onChanged: (text) => vm.setQuerySearch(text),
    );
  }
}
