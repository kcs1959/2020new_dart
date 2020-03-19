import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workDetailLayout.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class WorkDetailPage extends StatelessWidget {
  static const routeName = "/works/detail";

  DeviceInfo deviceInfo;
  @override
  Widget build(BuildContext context) {
    final WorkInfo args = ModalRoute.of(context).settings.arguments
      ?? WorksData.random();

    Future(() {
      print(ModalRoute.of(context).overlayEntries);
    });

    return Scaffold(
      backgroundColor: Color(0x80000000),
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: LayoutBuilder(
            builder: (context, boxConstraint) {
              deviceInfo = DeviceInfo.measure(boxConstraint.biggest);
              return WorkDetailLayout(
                heroTag: "HOGE",
                color: Colors.red,
                children: <Widget>[
                  Text(args.title, style: BaseTextStyles.h2,),
                  RaisedButton(
                    color: Color(0x61000000),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("閉じる", style: BaseTextStyles.button,),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}