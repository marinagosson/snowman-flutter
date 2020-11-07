import 'package:snowman/common/widgets/text.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;

  final double _elevation = 3;

  ButtonWidget(
      {this.label, this.onPress, this.disabled, this.transparent, this.icon});

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = colors.buttonBackgroundColor;
    Color textColor = colors.buttonTextColor;

    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: RaisedButton(
          onPressed: action,
          elevation: _elevation,
          color: backgroundColor,
          child: TextWidget(
            text: label.toUpperCase() ?? "Label",
            small: true,
            color: textColor,
          ),
        ));
  }
}
