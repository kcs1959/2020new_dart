import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

const TextStyle menuTextStyle = TextStyle(
  color: Colors.white70,
);

class MainAppBar extends StatefulWidget {
  final VoidCallback toWhat, toShinkan, toWork, toQA;
  final bool isMobile;

  MainAppBar({
    Key key,
    @required this.toWhat,
    @required this.toShinkan,
    @required this.toWork,
    @required this.toQA,
    this.isMobile = false
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  bool _isExpanded = false;
  ExpandableController _controller;

  List<Widget> _mainAppBarButtons;
  Text _shinkanTitle;
  Widget _kcsLogo;

  @override
  void initState() {
    super.initState();

    _controller = ExpandableController();

    _controller.addListener(() {
      setState(() {
        _isExpanded = _controller.expanded;
      });
    });

    _mainAppBarButtons = [
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: widget.toWhat,
        child: Text("KCSって何?", style: menuTextStyle,).safeText(),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: widget.toShinkan,
        child: Text("新歓情報", style: menuTextStyle,).safeText(),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: widget.toWork,
        child: Text("作品集", style: menuTextStyle,).safeText(),
      ).translucentOnHover,
      FlatButton(
        hoverColor: Colors.transparent,
        onPressed: widget.toQA,
        child: Text("よくある質問", style: menuTextStyle,).safeText(),
      ).translucentOnHover,
    ];

    _shinkanTitle = Text(
      "新歓",
      style: BaseTextStyles.logo,
    ).safeText();

    _kcsLogo = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset("image/kcslogo.png", fit: BoxFit.fitHeight,),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isMobile) {
      return Positioned(
        top: 0, left: 0, right: 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: _isExpanded ? Colors.black87 : Colors.transparent,
          child: Row(
            children: <Widget>[
              Container(
                height: 60.0,
                child: _kcsLogo
              ),
              _shinkanTitle,
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
                        children: _mainAppBarButtons
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
    else {
      return Positioned(
        top: 0, left: 0, right: 0,
        child: AppBar(
          title: Container(
            height: 60.0,
            child: Row(
              children: <Widget>[
                _kcsLogo,
                _shinkanTitle
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: _mainAppBarButtons
        ),
      );
    }
  }
}