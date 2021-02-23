import 'package:flutter/material.dart';
import 'package:diet_controller/utils/ui_constants.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final EdgeInsets padding;
  final Color disabledColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color highlightColor;
  final double width;
  final double height;
  final bool circleShape;
  final double circleRadius;
  final Border border;
  final bool disable;
  final BorderRadius borderRadius;

  const CustomButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.padding,
    this.disabledColor,
    this.backgroundColor,
    this.splashColor,
    this.width,
    this.height,
    this.highlightColor,
    this.circleShape = false,
    this.border,
    this.circleRadius,
    this.disable = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      foregroundDecoration: BoxDecoration(
        color: disable ? FontColors.lightGrey : UIColors.transparent,
        backgroundBlendMode: BlendMode.saturation,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Material(
            color: UIColors.transparent,
            child: Ink(
              width: !circleShape ? null : circleRadius ?? 50,
              height: !circleShape ? null : circleRadius ?? 50,
              decoration: BoxDecoration(
                shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: circleShape ? null : BorderRadius.circular(50),
                border: border,
                color: backgroundColor ?? UIColors.primary,
              ),
              child: InkWell(
                highlightColor: highlightColor ?? UIColors.secondaryDarker,
                splashColor: splashColor ?? UIColors.secondaryDarker,
                onTap: disable ? null : onPressed,
                child: Padding(
                  padding: padding ??
                      EdgeInsets.symmetric(
                        horizontal: Spacing.normal,
                        vertical: Spacing.medium,
                      ),
                  child: Container(
                    child: Center(child: child),
                  ),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
