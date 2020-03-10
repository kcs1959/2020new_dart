import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';

const TextStyle menuTextStyle = TextStyle(
  color: Colors.white70,
);

class SubAppBar extends StatefulWidget {
  final DeviceInfo deviceInfo;

  SubAppBar({Key key, this.deviceInfo}): super(key: key);

  @override
  State<StatefulWidget> createState() => _SubAppBarState();
}

class _SubAppBarState extends State<SubAppBar> {

  void toTop() {
    Navigator.of(context).pushNamed("/main");
  }

  void toGroup() {
    Navigator.of(context).pushNamed("/groups");
  }

  void toShinkan() {
    Navigator.of(context).pushNamed("/shinkan");
  }

  void toWorks() {
    Navigator.of(context).pushNamed("/works");
  }

  void toQA() {
    Navigator.of(context).pushNamed("/questions");
  }

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
    List<Widget> menuButtons = [
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: toTop,
        child: Text("Top", style: menuTextStyle,),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: toShinkan,
        child: Text("新歓情報", style: menuTextStyle,),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: toWorks,
        child: Text("作品集", style: menuTextStyle,),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: toQA,
        child: Text("質問集", style: menuTextStyle,),
      ).translucentOnHover,
    ];

    return widget.deviceInfo.device == Device.PC
        ? AppBar(
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
      actions: menuButtons
        )
        : AnimatedContainer(
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
                    children: menuButtons
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
    );
  }
}