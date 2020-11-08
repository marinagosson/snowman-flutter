import 'package:snowman/common/widgets/text.dart';
import 'package:snowman/common/values/colors.dart' as colors;
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;
  final double elevation;
  final bool loading;

  ButtonWidget(
      {this.label,
      this.onPress,
      this.disabled,
      this.transparent,
      this.icon,
      this.elevation,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = colors.buttonBackgroundColor;
    Color textColor = colors.buttonTextColor;

    return Container(
      height: 45,
      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: elevation == null ? 0 : elevation,
        onPressed: action,
        color: backgroundColor,
        child: loading != null && loading
            ? CircularProgressIndicator()
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
