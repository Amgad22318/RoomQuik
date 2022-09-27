import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeCarousalItem extends StatefulWidget {
  final String imagePath;

  const HomeCarousalItem({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<HomeCarousalItem> createState() => _HomeCarousalItemState();
}

class _HomeCarousalItemState extends State<HomeCarousalItem> {
  late Image carousalImage;
  @override
  void initState() {
    carousalImage = Image.asset(
      widget.imagePath,
      fit: BoxFit.cover,
      width: 90.w,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(carousalImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12.sp),
        child: carousalImage);
  }
}
