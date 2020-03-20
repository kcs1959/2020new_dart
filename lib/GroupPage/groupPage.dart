import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupAIPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupBlenderPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupContentView.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupDTMPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupUnityPage.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupWebPage.dart';
import 'package:kcs_2020_shinkan_web/mainFooter.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/util/fastNavigator.dart';
import 'package:kcs_2020_shinkan_web/view/subAppBar.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigateGroupsArgument args = ModalRoute.of(context).settings.arguments;
    return _GroupPageCore(argument: args,);
  }
}

class _GroupPageCore extends StatefulWidget {
  final NavigateGroupsArgument argument;

  _GroupPageCore({Key key, this.argument}): super(key: key);

  @override
  State<StatefulWidget> createState() => _GroupPageCoreState();
}

class _GroupPageCoreState extends State<_GroupPageCore> {
  DeviceInfo deviceInfo;

  Map<String, RoutePageBuilder> groupPageMap = {
    "/ai": (_,__,___) => new GroupAIPage(),
    "/unity": (_,__,___) => new GroupUnityPage(),
    "/web": (_,__,___) => new GroupWebPage(),
    "/blender": (_,__,___) => new GroupBlenderPage(),
    "/dtm": (_,__,___) => new GroupDTMPage(),
  };

  @override
  void initState() {
    super.initState();
    analytics().logEvent("PAGE_GROUP", null);

    if(widget.argument != null && groupPageMap.containsKey(widget.argument.path)) {
      Future(() {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: groupPageMap[widget.argument.path],
            settings: RouteSettings(name: "/groups" + widget.argument.path,),
            opaque: false
        ));
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          deviceInfo = DeviceInfo.measure(boxConstraints.biggest);
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SubAppBar(
                  deviceInfo: deviceInfo,
                  title: Text(
                    "班紹介",
                    style: TextStyle(
                        fontFamily: "CorporateLogo",
                        color: Colors.white,
                        fontSize: 40.0
                    ),
                  ).safeText(),
                ),
                GroupContentView(deviceInfo: deviceInfo,),
                MainFooter(deviceInfo: deviceInfo, shareText: "KCS新歓特設ページ2020 -班紹介 \n https://kcs1959.github.io/2020new/#/groups",)
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavigateGroupsArgument {
  final String path;

  NavigateGroupsArgument(this.path);
}
