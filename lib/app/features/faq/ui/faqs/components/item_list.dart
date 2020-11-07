import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/values/colors.dart';
import 'package:snowman/common/widgets/text.dart';

class ItemList extends StatelessWidget {
  final FAQ faq;
  final VoidCallback onTap;
  ItemList(this.faq, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: faq.isSelected ? 100 : 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(30, 0, 0, 0),
          blurRadius: 5,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 10, color: Color(faq.color))),
                    color: Color(faq.color),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(50.0),
                        bottomLeft: const Radius.circular(50.0))),
              ),
              Positioned.fill(
                left: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(100.0),
                          bottomLeft: const Radius.circular(100.0))),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: TextWidget(
                          text: faq.question,
                          color: textTitleItemListColor,
                          bold: true,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: TextWidget(
                      text: faq.answer,
                      color: textDescriptionItemListColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
