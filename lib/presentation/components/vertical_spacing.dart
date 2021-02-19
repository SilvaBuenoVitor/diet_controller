import 'package:flutter/material.dart';
import 'package:diet_controller/utils/ui_constants.dart';

//STANDART VERTICAL SPACING BETWEEN ELEMENTS
class VerticalSpacing extends StatelessWidget {
  final double spacing;

  VerticalSpacing({this.spacing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing == null ? Spacing.normal : spacing,
    );
  }
}
