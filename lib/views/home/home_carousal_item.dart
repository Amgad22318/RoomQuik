import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeCarousalItem extends StatelessWidget {
  final String imagePath;

  const HomeCarousalItem({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12.sp),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 90.w,
        ));
  }
}
