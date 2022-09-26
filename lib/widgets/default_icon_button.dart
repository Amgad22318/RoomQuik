import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultIconButton extends StatelessWidget {
  final Widget icon;
  final double radius;
  final Color? background;
  final Color? iconColor;
  final Color? splashColor;
  final VoidCallback onPressed; // voidCallback = void Function()
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final double? iconSize;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  const DefaultIconButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.background,
    this.radius = 12,
    this.child,
    this.splashColor,
    required this.icon,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(8.0),
    this.iconSize,
    this.iconColor,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: IconButton(
        padding: padding,
        constraints: constraints,
        alignment: AlignmentDirectional.center,
        splashColor: splashColor,
        color: iconColor,
        onPressed: onPressed,
        iconSize: iconSize ?? 24.sp,
        icon: icon,
      ),
    );
  }
}
