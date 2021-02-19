import 'package:flutter/material.dart';
import 'package:diet_controller/utils/ui_constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool bold;
  final TextAlign textAlign;
  final int maxLines;
  final EdgeInsets padding;

  const CustomText(
    this.text, {
    Key key,
    this.fontSize,
    this.color,
    this.bold = false,
    this.textAlign,
    this.maxLines,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? 999999,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize ?? FontSize.normal,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
