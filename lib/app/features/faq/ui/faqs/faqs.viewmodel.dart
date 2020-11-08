import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:snowman/app/features/faq/data/faq.repository.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/base/base_viewmodel.dart';

class FAQSViewModel extends BaseViewModel {
  FAQRepository repository = FAQRepository();

  TextEditingController searchQueryController = TextEditingController();

  final _toolbarSearch = StreamController.broadcast();
  Stream get toolbarSearch => _toolbarSearch.stream;

  final streamExpandedList = PublishSubject();
  final streamListFAQs = PublishSubject<List<FAQ>>();

  List<FAQ> faqs = [];
  List<FAQ> faqsFiltered = [];

  setQuerySearch(String query) {
    if (query.isNotEmpty) {
      faqsFiltered = faqs.where((element) {
        if (element.question.toLowerCase().contains(query.toLowerCase()))
          return true;
        return false;
      }).toList();

      if (faqsFiltered.isEmpty)
        streamListFAQs.addError("Nenhuma pergunta encontrada");
      else
        streamListFAQs.add(faqsFiltered);
    } else {
      this.faqsFiltered = faqs;
      streamListFAQs.add(faqsFiltered);
    }
  }

  startedSearch() {
    _toolbarSearch.add(true);
  }

  stopSearch() {
    _toolbarSearch.add(false);
  }

  getAllFAQs() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    faqs = await repository.allFAQ();
    faqsFiltered = faqs;
    streamListFAQs.add(faqs);
    setLoading(false);
  }

  setExpanded(int index) {
    final bool isCurrent = faqs.elementAt(index).isSelected;
    faqs.forEach((element) => element.isSelected = false);
    if (!isCurrent) faqs.elementAt(index).isSelected = true;
    streamExpandedList.add(faqs);
  }

  @override
  void clear() {}
}
