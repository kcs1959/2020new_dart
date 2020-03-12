import 'package:auto_size_text/auto_size_text.dart';
import 'package:clippy_flutter/diagonal.dart';
import 'package:clippy_flutter/trapezoid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupAIPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupBlenderPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupDTMPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupUnityPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupWebPage.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/view/underConstructionView.dart';
import 'package:kcs_2020_shinkan_web/wid/scaleOnHover.dart';

const TextStyle headerText = TextStyle(
    fontSize: 300.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.0
);

Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
    ) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}

class GroupContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  GroupContentView({Key key, this.deviceInfo}): super(key: key);

  void toAIPage(context) => toPage(context, (_,__,___) => new GroupAIPage(), "/groups/ai");
  void toUnityPage(context) => toPage(context, (_,__,___) => new GroupUnityPage(), "/groups/unity");
  void toWebPage(context) => toPage(context, (_,__,___) => new GroupWebPage(), "/groups/web");
  void toBlenderPage(context) => toPage(context, (_,__,___) => new GroupBlenderPage(), "/groups/blender");
  void toDTMPage(context) => toPage(context, (_,__,___) => new GroupDTMPage(), "/groups/dtm");

  void toPage(context, RoutePageBuilder navigateTo, String routeName) {
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: navigateTo,
        settings: RouteSettings(name: routeName),
        opaque: false
    ));
  }

  @override
  Widget build(BuildContext context) {
    final diagonalRatio = 0.2;

    if(deviceInfo.displayAspect == DisplayAspect.WIDE
      || deviceInfo.displayAspect == DisplayAspect.NEAR_SQUARE) {
      final contentWidth = deviceInfo.size.width / 5;
      final diagonalWidth = contentWidth * diagonalRatio;

      return Container(
        width: deviceInfo.size.width,
        height:  deviceInfo.size.height - 60,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0, bottom: 0, left: 0,
              child: Diagonal(
                position: DiagonalPosition.TOP_RIGHT,
                axis: Axis.vertical,
                clipHeight: diagonalWidth,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_,__,___) => new GroupAIPage(),
                        settings: RouteSettings(name: "/groups/ai"),
                        opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "AI",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.red,
                        width: contentWidth + diagonalWidth/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: AutoSizeText(
                                "AI",
                                style: headerText,
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, bottom: 0, left: contentWidth - diagonalWidth / 2,
              child: Trapezoid(
                edge: Edge.TOP,
                cutLength: diagonalWidth,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupUnityPage(),
                          settings: RouteSettings(name: "/groups/unity"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "UNITY",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.blue,
                        width: contentWidth + diagonalWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: AutoSizeText(
                                    "Unity",
                                    style: headerText,
                                    overflow: TextOverflow.visible,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, bottom: 0, left: contentWidth * 2 - diagonalWidth / 2,
              child: Trapezoid(
                edge: Edge.BOTTOM,
                cutLength: diagonalWidth,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupWebPage(),
                          settings: RouteSettings(name: "/groups/web"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "WEB",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.green,
                        width: contentWidth + diagonalWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: AutoSizeText(
                                    "Web",
                                    style: headerText,
                                    overflow: TextOverflow.visible,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, bottom: 0, left: contentWidth * 3 - diagonalWidth / 2,
              child: Trapezoid(
                edge: Edge.TOP,
                cutLength: diagonalWidth,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupBlenderPage(),
                          settings: RouteSettings(name: "/groups/blender"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "BLENDER",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.orange,
                        width: contentWidth + diagonalWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: AutoSizeText(
                                    "Blender",
                                    style: headerText,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, bottom: 0, left: contentWidth * 4 - diagonalWidth / 2,
              child: Diagonal(
                position: DiagonalPosition.TOP_LEFT,
                axis: Axis.vertical,
                clipHeight: diagonalWidth,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupDTMPage(),
                          settings: RouteSettings(name: "/groups/dtm"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "DTM",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.purple,
                        width: contentWidth + diagonalWidth/2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 32),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: AutoSizeText(
                                    "DTM",
                                    style: headerText,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    else {
      final contentHeight = deviceInfo.size.height / 5;
      final diagonalHeight = contentHeight * diagonalRatio;
      return Container(
        width: deviceInfo.size.width,
        height:  deviceInfo.size.height - 60,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0, right: 0, top: 0,
              child: Diagonal(
                position: DiagonalPosition.BOTTOM_LEFT,
                axis: Axis.horizontal,
                clipHeight: diagonalHeight,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupAIPage(),
                          settings: RouteSettings(name: "/groups/ai"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "AI",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.red,
                        height: contentHeight + diagonalHeight/2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: AutoSizeText(
                                "AI",
                                style: headerText,
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, top: contentHeight - diagonalHeight / 2,
              child: Trapezoid(
                edge: Edge.LEFT,
                cutLength: diagonalHeight,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupUnityPage(),
                          settings: RouteSettings(name: "/groups/unity"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "UNITY",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.blue,
                        height: contentHeight + diagonalHeight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: AutoSizeText(
                                  "Unity",
                                  style: headerText,
                                  overflow: TextOverflow.visible,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, top: contentHeight * 2 - diagonalHeight / 2,
              child: Trapezoid(
                edge: Edge.RIGHT,
                cutLength: diagonalHeight,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupWebPage(),
                          settings: RouteSettings(name: "/groups/web"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "WEB",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.green,
                        height: contentHeight + diagonalHeight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: AutoSizeText(
                                  "Web",
                                  style: headerText,
                                  overflow: TextOverflow.visible,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, top: contentHeight * 3 - diagonalHeight / 2,
              child: Trapezoid(
                edge: Edge.LEFT,
                cutLength: diagonalHeight,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupBlenderPage(),
                          settings: RouteSettings(name: "/groups/blender"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "BLENDER",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.orange,
                        height: contentHeight + diagonalHeight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: AutoSizeText(
                                  "Blender",
                                  style: headerText,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, top: contentHeight * 4 - diagonalHeight / 2,
              child: Diagonal(
                position: DiagonalPosition.TOP_LEFT,
                axis: Axis.horizontal,
                clipHeight: diagonalHeight,
                child: ScaleOnHover(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_,__,___) => new GroupDTMPage(),
                          settings: RouteSettings(name: "/groups/dtm"),
                          opaque: false
                      ));
                    },
                    child: Hero(
                      tag: "DTM",
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: Container(
                        color: Colors.purple,
                        height: contentHeight + diagonalHeight/2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: AutoSizeText(
                                  "DTM",
                                  style: headerText,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}