import 'package:flutter/material.dart';
import 'dart:html' as html;

class ScaleOnHover extends StatefulWidget {
  final Widget child;

  ScaleOnHover({Key key, this.child}): super(key: key);

  @override
  State<StatefulWidget> createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> with SingleTickerProviderStateMixin {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);
  bool _hovering = false;
  final appContainer = html.window.document.getElementById('app-container');

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ).drive(
      Tween<double>(
        begin: 1,
        end: 1.05,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: ScaleTransition(
        scale: animation,
        child: widget.child,
      )
    );
  }
  void _mouseEnter(bool hover) {
    if(hover) {
      animationController.forward();
      appContainer.style.cursor = 'pointer';
    }
    else {
      animationController.reverse();
      appContainer.style.cursor = 'default';
    }
  }
}