import 'package:flutter/material.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? value;
  const DefaultLoadingIndicator({Key? key, this.color, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
      value: value,
    ));
  }
}
