import 'package:flutter/material.dart';

class WorkDetailLayout extends StatelessWidget {
  final List<Widget> children;

  WorkDetailLayout({Key key, this.children}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 3/4,
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Container(
              color: Color(0xFF121212),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                      children: children
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}