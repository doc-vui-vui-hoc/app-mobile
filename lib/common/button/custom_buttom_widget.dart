import 'package:ar_book/common/button/vsp_touch.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String? icon;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? radius;
  final BoxBorder? border;
  final Color? colorBoder;
  final Color? backgroudColor;
  final VoidCallback onPressed;
  final bool showIcon;
  const CustomButtomWidget({
    Key? key,
    required this.title,
    this.titleColor,
    this.icon,
    this.height,
    this.width,
    this.radius,
    this.border,
    this.colorBoder,
    this.backgroudColor,
    required this.onPressed,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VspTouch(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: backgroudColor ?? CustomColors.green006338,
            borderRadius: radius ?? BorderRadius.circular(8.0),
            border: border ??
                Border.all(
                    width: 1, color: colorBoder ?? CustomColors.green006338)),
        child: showIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Images.imageAssets(
                    icon ?? Images.ic_back,
                    height: 24,
                    width: 24,
                    fit: BoxFit.scaleDown,
                    color: titleColor,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: titleColor,
                        ),
                  ),
                ],
              )
            : Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: titleColor,
                    ),
              ),
      ),
    );
  }
}
