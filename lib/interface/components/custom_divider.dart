import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(padding: EdgeInsets.fromLTRB(Spacing.small, 0, Spacing.small, 0))
      );
  }
}