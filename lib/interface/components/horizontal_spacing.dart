import 'package:flutter/material.dart';
import 'package:diet_controller/utils/ui_constants.dart';

class HorizontalSpacing extends StatelessWidget {
  final double spacing;
  final bool hide;

  HorizontalSpacing({
    this.spacing,
    this.hide = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hide ? 0 : spacing ?? Spacing.normal,
    );
  }
}
