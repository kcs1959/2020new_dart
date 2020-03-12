import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/QAPage/questions.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/view/underConstructionView.dart';
import 'package:kcs_2020_shinkan_web/wid/floatingOnHoverCard.dart';

class QAContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  QAContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    //return UnderConstructionView(deviceInfo: deviceInfo,);
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: deviceInfo.size.height * 4 / 3,
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("よくある質問", style: BaseTextStyles.h1(deviceInfo),),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "質問を検索..."
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: Questions.getList.map((question) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingOnHoverCard(
                      colorValue: 0x17FFFFFF,
                      child: InkWell(
                        splashColor: Color(0x0FFFFFFF),
                        onTap: () { },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar(
                                    child: Text("Q"),
                                  ),
                                ),
                                Text(
                                  question.question,
                                  style: BaseTextStyles.question
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0x99c62828),
                                      child: Text("A"),
                                    ),
                                  ),
                                  Text(
                                    question.answer,
                                    style: BaseTextStyles.plain
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ),
            Text(
              "その他疑問のある方は、以下からも質問できます。",
              style: BaseTextStyles.h4,
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: <Widget>[
                linkCard("LINE@", "@525eassk", Image.asset("image/linelogo.png", height: 48), Link.toLineKCS),
                linkCard("Twitter", "@kcs1959", Image.asset("image/twitterlogo.png", height: 48,), Link.toTwitterKCS),
                linkCard("質問箱", "@kcs1959", Icon(Icons.inbox, size: 48, color: Color(0x61FFFFFF),), Link.toShitsumonBakoKCS),
                linkCard("Email", "kcs1959@gmail.com", Icon(Icons.mail, size: 48, color: Color(0x61FFFFFF),), Link.toMailKCS),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget linkCard(String title, String subtitle, Widget image, VoidCallback linkTo) {
  return Container(
    padding: EdgeInsets.all(8.0),
    width: 200,
    child: FloatingOnHoverCard(
      colorValue: 0x17FFFFFF,
      child: InkWell(
        splashColor: Color(0x0FFFFFFF),
        onTap: linkTo,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ListTile(
              leading: image,
              title: Text(title, style: BaseTextStyles.button,),
              subtitle: Text(subtitle, style: BaseTextStyles.subtitle1,),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.call_made, color: Color(0x61FFFFFF),),
            )
          ],
        ),
      ),
    ),
  );
}