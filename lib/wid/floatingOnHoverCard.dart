import 'package:flutter/material.dart';

class FloatingOnHoverCard extends StatefulWidget {
  final Widget child;
  final int colorValue;

  FloatingOnHoverCard({Key key, @required this.child, @required this.colorValue}): super(key: key);

  @override
  State<StatefulWidget> createState() => _FloatingOnHoverCardState();
}

class _FloatingOnHoverCardState extends State<FloatingOnHoverCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Card(
        color: Color(0x00000000),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: widget.child,
          color: _hovering ? Color(widget.colorValue + 0x0A000000) : Color(widget.colorValue),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}