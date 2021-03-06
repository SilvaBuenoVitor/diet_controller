import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/material.dart';


class LoadingBar extends StatelessWidget {
  final Color accentColor;
  final Color backgroundColor;

  const LoadingBar({
    Key key,
    this.accentColor = UIColors.gradient1,
    this.backgroundColor = UIColors.gradient2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: accentColor,
      ),
      child: LinearProgressIndicator(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
