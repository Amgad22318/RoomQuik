import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';

class DefaultListTile extends StatelessWidget {
  final String title;
  final IconData trailingIcon;

  const DefaultListTile(
      {Key? key, required this.title, required this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DefaultText(
        text: title,
        fontSize: 13.sp,
      ),
      trailing: Icon(
        trailingIcon,
        size: 25.sp,
      ),
    );
  }
}
