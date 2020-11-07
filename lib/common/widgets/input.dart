import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snowman/common/values/dimens.dart' as dimens;
import 'package:snowman/common/values/colors.dart' as colors;

class InputWidget extends StatefulWidget {
  final bool autofocus;
  final String value;
  final Function(dynamic) onChange;
  final String placeholder;
  final bool multiline;
  final int maxLines;
  final String errorMessage;
  final String labelText;
  final String mask;

  const InputWidget(
      {Key key,
      this.autofocus,
      this.value,
      this.maxLines,
      this.errorMessage,
      this.onChange,
      this.placeholder,
      this.multiline,
      this.labelText,
      this.mask})
      : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController _controller;

  @override
  void didChangeDependencies() {
    _controller = new TextEditingController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.value;
    if (widget.value != null)
      _controller.selection =
          TextSelection.collapsed(offset: widget.value.length);

    final double gapPadding = 5;

    return Padding(
      padding: EdgeInsets.only(top: dimens.fieldSpace),
      child: TextField(
          controller: _controller,
          onChanged: (value) {
            if (widget.onChange != null) widget.onChange(value);
          },
          maxLines: widget.multiline == true ? widget.maxLines : 1,
          style: TextStyle(color: colors.textInputColor),
          autofocus: widget.autofocus == null ? false : true,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.all(18),
              hintText: widget.value == null ? "Holder" : widget.value,
              labelText: widget.labelText == null
                  ? widget.placeholder
                  : widget.labelText,
              hintStyle: TextStyle(
                  color: Colors.transparent,
                  fontSize: dimens.fontInputWidget,
                  fontWeight: FontWeight.bold),
              enabled: true,
              labelStyle: TextStyle(
                  fontSize: dimens.fontInputWidget,
                  color: colors.labelInputColor,
                  fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                gapPadding: gapPadding,
                borderSide:
                    BorderSide(color: colors.labelInputColor, width: 0.5),
              ),
              border: OutlineInputBorder(
                  gapPadding: gapPadding,
                  borderSide: BorderSide(
                    color: colors
                        .borderInputColor, //cor da label quando esta com focus
                    width: 0,
                  )),
              focusedBorder: OutlineInputBorder(
                  gapPadding: gapPadding,
                  borderSide: BorderSide(
                      color: colors
                          .borderInputColor, //cor da label quando esta com focus
                      width: 1)))),
    );
  }
}
