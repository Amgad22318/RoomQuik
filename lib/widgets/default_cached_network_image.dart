import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_svg.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final BoxFit? fit;

  const DefaultCachedNetworkImage(
      {Key? key,
      this.height,
      required this.imageUrl,
      this.width,
      required this.fit})
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
                  child: CircularProgressIndicator(
                value: downloadProgress.downloaded.toDouble(),
              ));
            },
            errorWidget: (context, url, error) => Padding(
              padding: EdgeInsets.all(14.sp),
              child: const DefaultSvg(imagePath: 'assets/default_photo.svg'),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(14.sp),
            child: const DefaultSvg(imagePath: 'assets/default_photo.svg'),
          );
  }
}
