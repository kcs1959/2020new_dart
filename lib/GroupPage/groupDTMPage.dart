import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/GroupPage/groupInfoLayout.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class GroupDTMPage extends StatelessWidget {
  DeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x80FFFFFF),
        body: LayoutBuilder(
            builder: (context, boxConstraint) {
              deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
              return GroupInfoLayout(
                heroTag: "DTM",
                color: Colors.purple,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("DTM班", style: BaseTextStyles.h1(deviceInfo),),
                  ),
                  Image.asset("image/groups/dtm.png", fit: BoxFit.fitWidth,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("DTM班では各種DAW(Studio One,Cubase,Logicなどの作曲ソフト)を使って曲を作り、秋のM3でCDを売っています!普段はDAWの使い方、音楽理論の講習会等行っています!!", style: BaseTextStyles.plain,),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("閉じる", style: BaseTextStyles.button,),
                  )
                ],
              );
            }
        )
    );
  }
}