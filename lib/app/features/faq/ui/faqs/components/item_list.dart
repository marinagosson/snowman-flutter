import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snowman/app/features/faq/domain/faq.dart';
import 'package:snowman/common/values/colors.dart';
import 'package:snowman/common/widgets/text.dart';

class ItemList extends StatelessWidget {
  final FAQ faq;
  final Function onTap;
  ItemList(this.faq, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            blurRadius: 5,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Flexible(
                        child: TextWidget(
                      text: faq.question,
                      color: textTitleItemListColor,
                      bold: true,
                    )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  faq.isSelected
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Flexible(
                            child: TextWidget(
                              text: faq.answer,
                              color: textDescriptionItemListColor,
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(width: 12),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(faq.isSelected
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down))
          ],
        ),
      ),
    );
  }
}
