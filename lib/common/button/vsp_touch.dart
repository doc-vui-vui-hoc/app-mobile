import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VspTouch extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final Color? color;
  final Color disabledColor;
  final double? pressedOpacity;

  const VspTouch({
    Key? key,
    required this.child,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.alignment = Alignment.center,
    this.color,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.pressedOpacity = 0.25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
      pressedOpacity: pressedOpacity,
      padding: padding,
      borderRadius: borderRadius,
      alignment: alignment,
      color: color,
      disabledColor: disabledColor,
    );
  }
}
