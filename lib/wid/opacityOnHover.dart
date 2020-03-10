import 'package:flutter/material.dart';
class opacityOnHover extends StatefulWidget {
  final Widget child;
  // You can also pass the translation in here if you want to
  opacityOnHover({Key key, this.child}) : super(key: key);
  @override
  _opacityOnHoverState createState() => _opacityOnHoverState();
}
class _opacityOnHoverState extends State<opacityOnHover> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        opacity: _hovering ? 0.5 : 1.0,
      ),
    );
  }
  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}