import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/view/underConstructionView.dart';

class ScheduleContentView extends StatefulWidget {
  final DeviceInfo deviceInfo;

  ScheduleContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleContentViewState();
}

class _ScheduleContentViewState extends State<ScheduleContentView> {
  PageController pageViewController;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController(
      initialPage: 0
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return UnderConstructionView(deviceInfo: deviceInfo,);
    return Container(
      width: widget.deviceInfo.size.width,
      height:  widget.deviceInfo.size.height - 60,
      child: PageView(
        controller: pageViewController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AutoSizeText(
                      "Computer Society\n年間行事",
                      textAlign: TextAlign.center,
                      style: BaseTextStyles.h1Tint(widget.deviceInfo, tint: Color(0xFF1A237E)),
                    ),
                    IconButton(
                      onPressed: null,
                      /*onPressed: () {
                        setState(() {
                          pageViewController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },*/
                      iconSize: 72.0,
                      color: Color(0xFF1A237E),
                      icon: Icon(Icons.trending_flat),
                      tooltip: "Swipe to Continue",
                    ),
                    AutoSizeText(
                      "Coming Soon...",
                      textAlign: TextAlign.center,
                      style: BaseTextStyles.h2Tint(tint: Color(0xFF1A237E)),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Color(0xFF3F51B5),
                  ),
                ),
              )
            ],
          ),
          /*
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Color(0xFF3F51B5),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Color(0xFF3F51B5),
                          child: Text("4月", style: BaseTextStyles.h2,),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Color(0xFF3F51B5),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 96,
                          backgroundColor: Color(0xFF3F51B5),
                          child: Text("5月", style: BaseTextStyles.h2,),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}