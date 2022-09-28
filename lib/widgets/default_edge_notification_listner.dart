import 'package:flutter/material.dart';

class DefaultEdgeNotificationListener extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTop;
  final VoidCallback? onBottom;

  const DefaultEdgeNotificationListener({
    Key? key,
    required this.child,
    this.onTop,
    this.onBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: child,
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.atEdge) {
          if (notification.metrics.pixels == 0) {
            if (onTop != null) {
              onTop!.call();
            }
          } else {
            if (onBottom != null) {
              onBottom!.call();
            }
          }
        }
        return true;
      },
    );
  }
}
