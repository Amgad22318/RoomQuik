import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class HorizontalDivider extends StatelessWidget {
  final Color color;
  const HorizontalDivider({Key? key, this.color = defaultAppWhiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: color,
      thickness: 0.5,
    );
  }
}
