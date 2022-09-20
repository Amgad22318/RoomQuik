import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class DefaultWhiteTransparentBackground extends StatelessWidget {

  final Widget child;
  final double? verticalMargin;

  const DefaultWhiteTransparentBackground({
    Key? key,
    required this.child,
    this.verticalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 90.w,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
            horizontal: 5.w, vertical: verticalMargin ?? 3.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: defaultAppWhiteColor.withOpacity(0.2)),
        child: child,
      ),
    );
  }
}
