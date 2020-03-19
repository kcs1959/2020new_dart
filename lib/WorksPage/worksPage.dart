import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksContentView.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/util/fastNavigator.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class WorksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigateWorksArgument args = ModalRoute.of(context).settings.arguments;
    return WorksPageCore(argument: args,);
  }
}

class WorksPageCore extends StatefulWidget {
  final NavigateWorksArgument argument;

  WorksPageCore({Key key, this.argument}): super(key: key);

  @override
  State<StatefulWidget> createState() => WorksPageCoreState();
}

class WorksPageCoreState extends State<WorksPageCore> {
  DeviceInfo deviceInfo;

  @override
  void initState() {
    super.initState();
    analytics().logEvent("PAGE_WORKS", null);

    if(widget.argument != null) {
      Future(() {
        FastNavigator().pushNamed(
            Navigator.of(context),
            RouteSettings(name: "/works/detail", arguments: WorksData().works[widget.argument.openDetail]),
            false
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d0463),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "作品集",
                    style: TextStyle(
                        fontFamily: "CorporateLogo",
                        color: Colors.white,
                        fontSize: 40.0
                    ),
                  ),
                ),
                WorksContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, shareText: "KCS新歓特設ページ2020 -作品集 \n https://kcs1959.github.io/2020new/#/works",)
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavigateWorksArgument {
  int openDetail;
  NavigateWorksArgument(String detail) {
    if(detail == null) return;
    this.openDetail = int.tryParse(detail);
  }
}