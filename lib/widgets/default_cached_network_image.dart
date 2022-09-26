import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import 'default_loading_indicator.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final double? padding;
  final String imageUrl;
  final BoxFit? fit;

  const DefaultCachedNetworkImage(
      {Key? key,
      this.height,
      required this.imageUrl,
      this.width,
      required this.fit, this.iconSize, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != ''
        ? CachedNetworkImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Center(
                  child: DefaultLoadingIndicator(
                color: defaultAppWhiteColor,
                value: downloadProgress.downloaded.toDouble(),
              ));
            },
            errorWidget: (context, url, error) => Padding(
                padding: EdgeInsets.all(padding ?? 35.sp),
                child: Image.asset(
                  'assets/image/house.png',
                  height: iconSize ?? 75.sp,
                  color: defaultAppColor,
                )),
          )
        : Padding(
            padding: EdgeInsets.all(padding ?? 35.sp),
            child: Image.asset(
              'assets/image/house.png',
              height: iconSize ?? 75.sp,
              color: defaultAppColor,
            ),
    );
  }
}
