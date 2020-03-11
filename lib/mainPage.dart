import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainAppBar.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainQAView.dart';
import 'package:kcs_2020_shinkan_web/mainShinkanView.dart';
import 'package:kcs_2020_shinkan_web/mainTopPosterView.dart';
import 'package:kcs_2020_shinkan_web/mainWhatIsKCSView.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';
import 'package:kcs_2020_shinkan_web/wid/DelayLoadingView.dart';
import 'package:kcs_2020_shinkan_web/wid/DelayLoadingViewLite.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  ScrollController scrollController;

  DeviceInfo deviceInfo;

  GlobalKey mainTopKey = GlobalKey();
  GlobalKey mainWhatKey = GlobalKey();
  GlobalKey mainShinkanKey = GlobalKey();
  GlobalKey mainWorksKey = GlobalKey();
  GlobalKey mainQAKey = GlobalKey();
  GlobalKey mainFooterKey = GlobalKey();

  bool waitingMainTop = false;
  bool waitingMainWhat = true;
  bool waitingMainShinkan = true;
  bool waitingMainWork = true;
  bool waitingMainQA = true;
  bool waitingMainFooter = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    final position = scrollController.offset;
    final displayHeight = deviceInfo.size.height;
    final topHeight = mainTopKey.currentContext.size.height;
    final whatHeight = mainWhatKey.currentContext.size.height;
    final shinkanHeight = mainShinkanKey.currentContext.size.height;
    final workHeight = mainWorksKey.currentContext.size.height;
    final qaHeight = mainQAKey.currentContext.size.height;
    final footerHeight = mainFooterKey.currentContext.size.height;

    final topPosition = position;
    final bottomPosition = position + displayHeight;

    final topOfTop = 0;
    final topOfWhat = topHeight;
    final topOfShinkan = topHeight + whatHeight;
    final topOfWork = topHeight + whatHeight + shinkanHeight;
    final topOfQA = topHeight + whatHeight + shinkanHeight + workHeight;
    final topOfFooter = topHeight + whatHeight + shinkanHeight + workHeight + qaHeight;

    final inTop = topOfTop <= bottomPosition && topOfWhat >= topPosition;
    final inWhat = topOfWhat <= bottomPosition && topOfShinkan >= topPosition;
    final inShinkan = topOfShinkan <= bottomPosition && topOfWork >= topPosition;
    final inWork = topOfWork <= bottomPosition && topOfQA >= topPosition;
    final inQA = topOfQA <= bottomPosition && topOfFooter >= topPosition;
    final inFooter = topOfFooter <= bottomPosition;

    if(waitingMainTop && inTop) {//画面の上部がMainTop上にあったら
      setState(() { waitingMainTop = false; });
    }
    if(!waitingMainTop && !inTop) {//画面の上部がMainTopより下だったら
      setState(() { waitingMainTop = true; });
    }

    if(waitingMainWhat && inWhat) {
      setState(() { waitingMainWhat = false; });
    }
    if(!waitingMainWhat && !inWhat) {
      setState(() { waitingMainWhat = true; });
    }

    if(waitingMainShinkan && inShinkan) {
      setState(() { waitingMainShinkan = false; });
    }
    if(!waitingMainShinkan && !inShinkan) {
      setState(() { waitingMainShinkan = true; });
    }

    if(waitingMainWork && inWork) {
      setState(() { waitingMainWork = false; });
    }
    if(!waitingMainWork && !inWork) {
      setState(() { waitingMainWork = true; });
    }

    if(waitingMainQA && inQA) {
      setState(() { waitingMainQA = false; });
    }
    if(!waitingMainQA && !inQA) {
      setState(() { waitingMainQA = true; });
    }

    if(waitingMainFooter && inFooter) {
      setState(() { waitingMainFooter = false; });
    }
    if(!waitingMainFooter && !inFooter) {
      setState(() { waitingMainFooter = true; });
    }
  }

  void toWhatListener() {
    final topHeight = mainTopKey.currentContext.size.height;
    final topOfWhat = topHeight;

    scrollController.animateTo(
        topOfWhat,
        duration: const Duration(milliseconds: 500),
      curve: Curves.ease
    );
  }
  void toShinkanListener() {
    final topHeight = mainTopKey.currentContext.size.height;
    final whatHeight = mainWhatKey.currentContext.size.height;
    final topOfShinkan = topHeight + whatHeight;

    scrollController.animateTo(
        topOfShinkan,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }
  void toWorkListener() {
    final topHeight = mainTopKey.currentContext.size.height;
    final whatHeight = mainWhatKey.currentContext.size.height;
    final shinkanHeight = mainShinkanKey.currentContext.size.height;
    final topOfWork = topHeight + whatHeight + shinkanHeight;

    scrollController.animateTo(
        topOfWork,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }
  void toQAListener() {
    final topHeight = mainTopKey.currentContext.size.height;
    final whatHeight = mainWhatKey.currentContext.size.height;
    final shinkanHeight = mainShinkanKey.currentContext.size.height;
    final workHeight = mainWorksKey.currentContext.size.height;
    final topOfQA = topHeight + whatHeight + shinkanHeight + workHeight;

    scrollController.animateTo(
        topOfQA,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          /*return PageView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              MainTopPosterView(
                deviceInfo: deviceInfo,
                toWhat: toWhatListener,
                toShinkan: toShinkanListener,
                toWork: toWorkListener,
                toQA: toQAListener,
              ),
              SingleChildScrollView(child: MainWhatIsKCSView(deviceInfo: deviceInfo,)),
              SingleChildScrollView(child: MainShinkanView(deviceInfo: deviceInfo,)),
              SingleChildScrollView(child: MainWorksView(deviceInfo: deviceInfo,)),
              SingleChildScrollView(child: MainQAView(deviceInfo: deviceInfo,)),
              MainFooter(deviceInfo: deviceInfo,),
            ],
          );*/
          return Scrollbar(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  DelayLoadingView(
                      key: mainTopKey,
                      waiting: waitingMainTop,
                      child: MainTopPosterView(
                        deviceInfo: deviceInfo,
                        toWhat: toWhatListener,
                        toShinkan: toShinkanListener,
                        toWork: toWorkListener,
                        toQA: toQAListener,
                      )
                  ),
                  DelayLoadingViewLite(
                    key: mainWhatKey,
                      waiting: waitingMainWhat,
                      child: MainWhatIsKCSView(deviceInfo: deviceInfo,)
                  ),
                  DelayLoadingViewLite(
                    key: mainShinkanKey,
                    waiting: waitingMainShinkan,
                    child: MainShinkanView(deviceInfo: deviceInfo,),
                  ),
                  DelayLoadingViewLite(
                    key: mainWorksKey,
                      waiting: waitingMainWork,
                      child: MainWorksView(deviceInfo: deviceInfo,)
                  ),
                  DelayLoadingViewLite(
                    key: mainQAKey,
                      waiting: waitingMainQA,
                    child: MainQAView(deviceInfo: deviceInfo,),
                  ),
                  DelayLoadingViewLite(
                    key: mainFooterKey,
                    waiting: waitingMainFooter,
                    child: MainFooter(deviceInfo: deviceInfo,),
                  )
                  /*
                  Q＆A
                  footer
                   */
                ],
              ),
            ),
          );
        },
      ),
      /*body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            MainTopPosterView(key: mainTopKey, size: size,),
          ],
        ),
      )*/
    );
  }
}

enum DisplayAspect {
  WIDE, NEAR_SQUARE, PORTRAIT
}

enum Device {
  PC, PHONE
}

class DeviceInfo {
  final DisplayAspect displayAspect;
  final Device device;
  final Size size;

  DeviceInfo(this.displayAspect, this.device, this.size)
      : assert(displayAspect != null),
        assert(device != null),
        assert(size != null);

  static DeviceInfo measure(Size size) {
    DisplayAspect aspect;
    if(size.aspectRatio >= 4/3) {
      aspect = DisplayAspect.WIDE;
    }
    else if(size.aspectRatio >= 1/1) {
      aspect = DisplayAspect.NEAR_SQUARE;
    }
    else {
      aspect = DisplayAspect.PORTRAIT;
    }

    Device device;

    if(size.width > 769) {
      device = Device.PC;
    }
    else {
      device = Device.PHONE;
    }

    return DeviceInfo(aspect, device, size);
  }
}