import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';
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
      child: Card(
        child: Container(
          decoration: ShapeDecoration(
              shape: CustomRoundedRectangleBorder(
                  leftSide: BorderSide(color: Color(faq.color), width: 2),
                  topLeftCornerSide:
                      BorderSide(color: Color(faq.color), width: 2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  bottomLeftCornerSide:
                      BorderSide(color: Color(faq.color), width: 2))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 12,
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextWidget(
                          text: faq.question,
                          color: textTitleItemListColor,
                          bold: true,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      faq.isSelected
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextWidget(
                                text: faq.answer,
                                color: textDescriptionItemListColor,
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  )),
              SizedBox(
                width: 12,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(faq.isSelected
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down))
            ],
          ),
        ),
      ),
    );
  }
}
