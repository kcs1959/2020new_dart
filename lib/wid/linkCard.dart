import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/wid/floatingOnHoverCard.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

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
              title: Text(title, style: BaseTextStyles.button,).safeText(),
              subtitle: Text(subtitle, style: BaseTextStyles.subtitle1,).safeText(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.open_in_new, color: Color(0x61FFFFFF),),
            )
          ],
        ),
      ),
    ),
  );
}