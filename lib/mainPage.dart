import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainQAView.dart';
import 'package:kcs_2020_shinkan_web/mainScrollKeyController.dart';
import 'package:kcs_2020_shinkan_web/mainShinkanView.dart';
import 'package:kcs_2020_shinkan_web/mainTopPosterView.dart';
import 'package:kcs_2020_shinkan_web/mainWhatIsKCSView.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/wid/DelayLoadingView.dart';
import 'package:kcs_2020_shinkan_web/wid/DelayLoadingViewLite.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  MainScrollController mainScrollController;

  DeviceInfo deviceInfo;

  bool waitingMainTop = false;
  bool waitingMainWhat = true;
  bool waitingMainShinkan = true;
  bool waitingMainWork = true;
  bool waitingMainQA = true;
  bool waitingMainFooter = true;

  @override
  void initState() {
    super.initState();
    mainScrollController = MainScrollController();
    mainScrollController.addListener(scrollListener);
    analytics().logEvent("PAGE_MAIN", null);
  }

  void scrollListener() {
    final displayHeight = deviceInfo.size.height;

    if(waitingMainTop == mainScrollController.inTop(displayHeight)) {
      setState(() { waitingMainTop = !waitingMainTop; });
    }
    if(waitingMainWhat == mainScrollController.inWhat(displayHeight)) {
      setState(() { waitingMainWhat = !waitingMainWhat; });
    }
    if(waitingMainShinkan == mainScrollController.inShinkan(displayHeight)) {
      setState(() { waitingMainShinkan = !waitingMainShinkan; });
    }
    if(waitingMainWork == mainScrollController.inWork(displayHeight)) {
      setState(() { waitingMainWork = !waitingMainWork; });
    }
    if(waitingMainQA == mainScrollController.inQA(displayHeight)) {
      setState(() { waitingMainQA = !waitingMainQA; });
    }
    if(waitingMainFooter == mainScrollController.inFooter(displayHeight)) {
      setState(() { waitingMainFooter = !waitingMainFooter; });
    }
/*
    if(waitingMainTop && mainScrollController.inTop(displayHeight)) {//画面の上部がMainTop上にあったら
      setState(() { waitingMainTop = false; });
    }
    if(!waitingMainTop && !inTop) {//画面の上部がMainTopより下だったら
      setState(() { waitingMainTop = true; });
    }*/
  }

  void toWhatListener() {
    mainScrollController.controller.animateTo(
        mainScrollController.topOfWhat,
        duration: const Duration(milliseconds: 500),
      curve: Curves.ease
    );
  }
  void toShinkanListener() {
    mainScrollController.controller.animateTo(
        mainScrollController.topOfShinkan,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }
  void toWorkListener() {
    mainScrollController.controller.animateTo(
        mainScrollController.topOfWork,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }
  void toQAListener() {
    mainScrollController.controller.animateTo(
        mainScrollController.topOfQA,
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
          return Scrollbar(
            child: SingleChildScrollView(
              controller: mainScrollController.controller,
              child: Column(
                children: <Widget>[
                  DelayLoadingView(
                      key: mainScrollController.topKey,
                      waiting: waitingMainTop,
                      child: MainTopPosterView(
                        deviceInfo: deviceInfo,
                        toWhat: toWhatListener,
                        toShinkan: toShinkanListener,
                        toWork: toWorkListener,
                        toQA: toQAListener,
                      )
                  ),
                  DelayLoadingView(
                    key: mainScrollController.whatKey,
                      waiting: waitingMainWhat,
                      child: MainWhatIsKCSView(deviceInfo: deviceInfo,)
                  ),
                  DelayLoadingView(
                    key: mainScrollController.shinkanKey,
                    waiting: waitingMainShinkan,
                    child: MainShinkanView(deviceInfo: deviceInfo,),
                  ),
                  DelayLoadingView(
                    key: mainScrollController.worksKey,
                      waiting: waitingMainWork,
                      child: MainWorksView(deviceInfo: deviceInfo,)
                  ),
                  DelayLoadingView(
                    key: mainScrollController.qaKey,
                      waiting: waitingMainQA,
                    child: MainQAView(deviceInfo: deviceInfo,),
                  ),
                  DelayLoadingView(
                    key: mainScrollController.footerKey,
                    waiting: waitingMainFooter,
                    child: MainFooter(deviceInfo: deviceInfo, shareText: "KCS新歓特設ページ2020 -Top \n https://kcs1959.github.io/2020new/",),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
