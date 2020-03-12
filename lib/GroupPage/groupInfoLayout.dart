import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';

class GroupInfoLayout extends StatelessWidget {
  final List<Widget> children;
  final String heroTag;
  final Color color;

  GroupInfoLayout({Key key, this.children, this.heroTag, this.color}): super(key: key);

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
            child: Hero(
              tag: heroTag,
              child: Container(
                color: color,
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
      ),
    );
  }
}