import 'package:auto_size_text/auto_size_text.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/util/fastNavigator.dart';
import 'package:kcs_2020_shinkan_web/wid/scaleOnHover.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class WorksTile extends StatelessWidget {
  final WorkInfo info;

  WorksTile({Key key,@required this.info}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Diagonal(
        clipHeight: 0,
        child: ScaleOnHover(
          child: InkWell(
            onTap: () {
              FastNavigator().pushNamed(
                  Navigator.of(context),
                  RouteSettings(name: "/works/detail", arguments: info),
                  false
              );
            },
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: info.image.length > 0
                      ? Hero(
                          child: Image.asset(info.image[0], fit: BoxFit.cover,),
                          tag: info.head
                        )
                      : Container(color: Colors.orange,),
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    info.head,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 100,
                      fontFamily: "CorporateLogo",
                      color: Color(0xDEFFFFFF)
                    )
                  ).safeText(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum WorksTileDirection {
  PORTRAIT, LANDSCAPE
}