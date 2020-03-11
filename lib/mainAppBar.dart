import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'ext/hover_extensions.dart';

const TextStyle menuTextStyle = TextStyle(
  color: Colors.white70,
);

Widget mainAppBar(
    VoidCallback toWhat,
    VoidCallback toShinkan,
    VoidCallback toWork,
    VoidCallback toQA
    ) {
  return Positioned(
    top: 0, left: 0, right: 0,
    child: AppBar(
      title: Container(
        height: 60.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("image/kcslogo.png", fit: BoxFit.fitHeight,),
            ),
            Text(
              "新歓",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        FlatButton(
          hoverColor: Colors.transparent,
          onPressed: toWhat,
          child: Text("KCSって何?", style: menuTextStyle,),
        ).translucentOnHover,
        FlatButton(
          hoverColor: Colors.transparent,
          onPressed: toShinkan,
          child: Text("新歓情報", style: menuTextStyle,),
        ).translucentOnHover,
        FlatButton(
          hoverColor: Colors.transparent,
          onPressed: toWork,
          child: Text("作品集", style: menuTextStyle,),
        ).translucentOnHover,
        FlatButton(
          hoverColor: Colors.transparent,
          onPressed: toQA,
          child: Text("よくある質問", style: menuTextStyle,),
        ).translucentOnHover,
      ],
    ),
  );
}

class MainAppBarMobile extends StatefulWidget {
  final VoidCallback toWhat;
  final VoidCallback toShinkan;
  final VoidCallback toWork;
  final VoidCallback toQA;

  MainAppBarMobile({
    Key key,
    this.toWhat, this.toShinkan, this.toWork, this.toQA
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => MainAppBarMobileState();
}

class MainAppBarMobileState extends State<MainAppBarMobile> {
  bool _isExpanded = false;
  ExpandableController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ExpandableController();

    _controller.addListener(() {
      setState(() {
        _isExpanded = _controller.expanded;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, left: 0, right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: _isExpanded ? Colors.black87 : Colors.transparent,
        child: Row(
          children: <Widget>[
            Container(
              height: 60.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("image/kcslogo.png", fit: BoxFit.fitHeight,),
              ),
            ),
            Text(
              "新歓",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ExpandablePanel(
                  controller: _controller,
                  header: Container(),
                  expanded: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          hoverColor: Colors.transparent,
                          onPressed: widget.toWhat,
                          child: Text("KCSって何?", style: menuTextStyle,),
                        ).translucentOnHover,
                        FlatButton(
                          hoverColor: Colors.transparent,
                          onPressed: widget.toShinkan,
                          child: Text("新歓情報", style: menuTextStyle,),
                        ).translucentOnHover,
                        FlatButton(
                          hoverColor: Colors.transparent,
                          onPressed: widget.toWork,
                          child: Text("作品集", style: menuTextStyle,),
                        ).translucentOnHover,
                        FlatButton(
                          hoverColor: Colors.transparent,
                          onPressed: widget.toQA,
                          child: Text("よくある質問", style: menuTextStyle,),
                        ).translucentOnHover,
                      ],
                    ),
                  ),
                  theme: ExpandableThemeData(
                      hasIcon: true,
                      tapHeaderToExpand: true,
                      iconColor: Colors.white,
                    iconSize: 30.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}