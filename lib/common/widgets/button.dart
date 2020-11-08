import 'package:snowman/common/widgets/text.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool transparent;
  final IconData icon;
  final double elevation;
  final bool loading;

  ButtonWidget(
      {this.label,
      this.onPress,
      this.transparent,
      this.icon,
      this.elevation,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = colors.buttonBackgroundColor;
    Color textColor = onPress == null ? Colors.white : colors.buttonTextColor;

    return Container(
      height: 45,
      child: RaisedButton(
        disabledColor: Colors.grey,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: elevation == null ? 0 : elevation,
        onPressed: onPress,
        color: backgroundColor,
        child: loading != null && loading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : TextWidget(
                text: label ?? "Label",
                small: true,
                bold: true,
                color: textColor,
              ),
      ),
    );
  }
}
