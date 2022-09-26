import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DefaultMaterialButton extends StatelessWidget {
  final bool isUpperCase;
  final double width;
  final double? height;
  final double radius;
  final Color? background;
  final Color textColor;
  final Color? splashColor;
  final Color? disabledColor;
  final VoidCallback? onPressed; // voidCallback = void Function()
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? fontSize;
  final double? textScaleFactor;
  final double? elevation;

  const DefaultMaterialButton(
      {Key? key,
      this.textColor = defaultAppWhiteColor,
      required this.onPressed,
      this.text,
      this.width = double.infinity,
      this.isUpperCase = false,
      this.background,
      this.radius = 30,
      this.child,
      this.splashColor,
      this.padding,
      this.margin,
      this.height,
      this.fontSize,
      this.textScaleFactor,
      this.elevation = 1,
      this.disabledColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        disabledColor: disabledColor,
        elevation: elevation,
        splashColor: splashColor,
        color: background ?? defaultAppWhiteColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        onPressed: onPressed,
        child: child ??
            Text(
              isUpperCase ? text!.toUpperCase() : text!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textScaleFactor: textScaleFactor,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                  ),
            ),
      ),
    );
  }
}
