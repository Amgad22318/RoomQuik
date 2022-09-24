import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  CustomPageRoute(
      {required this.child,
      this.direction = AxisDirection.up,
      RouteSettings? settings})
      : super(
            settings: settings,
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: _getBeginOffset(), end: const Offset(0, 0))
          .animate(animation),
      child: child,
    );
  }

  Offset _getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
