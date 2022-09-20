import 'package:flutter/material.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  final Color? color;
  const DefaultLoadingIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: CircularProgressIndicator(color: color,));
  }
}
