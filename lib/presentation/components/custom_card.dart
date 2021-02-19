import 'package:flutter/material.dart';
import 'package:diet_controller/utils/ui_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const CustomCard({
    Key key,
    this.child,
    this.backgroundColor,
    this.margin,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: Padding(
        padding: padding,
        child: child,
      ),
      color: backgroundColor ?? UIColors.white,
      margin: margin ?? EdgeInsets.all(Spacing.small),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
