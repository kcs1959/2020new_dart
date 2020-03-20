import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class CharacterContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  CharacterContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if(deviceInfo.displayAspect == DisplayAspect.WIDE
      || deviceInfo.displayAspect == DisplayAspect.NEAR_SQUARE) {
      return Container(
        width: deviceInfo.size.width,
        height:  deviceInfo.size.height,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 72),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  color: Color(0xFFE6EE9C),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "KCSちゃん",
                                style: BaseTextStyles.h2CharacterBlue,
                              ).safeText(),
                            ),
                            IconButton(
                              onPressed: () {
                                Link.toKCSTuber();
                              },
                              icon: Icon(Icons.open_in_new),
                              iconSize: 40,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "KCSのマスコットキャラ。数多くの部員の作品に登場する大人気キャラ！！",
                            style: BaseTextStyles.plainCharacterBlue,
                          ).safeText(),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset("image/kcschann_standing.png", fit: BoxFit.contain,),
                        )
                      ],
                    )
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 72),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))
                  ),
                  color: Color(0xFFE6EE9C),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "KCSドラゴン",
                            style: BaseTextStyles.h2CharacterRed,
                          ).safeText(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "たまに出番がある",
                            style: BaseTextStyles.plainCharacterRed,
                          ).safeText(),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset("image/kcsdragon.png", fit: BoxFit.contain,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      );
    }
    else {
      return Container(
        width: deviceInfo.size.width,
        height:  deviceInfo.size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
              child: Container(
                height: deviceInfo.size.height / 2 - 64 - 30,
                child: Card(
                  color: Color(0xFFE6EE9C),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: AutoSizeText(
                                  "KCSちゃん",
                                  maxLines: 1,
                                  style: BaseTextStyles.h2CharacterBlue,
                                ).safeText(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  "KCSのマスコットキャラ。\n数多くの部員の作品に\n登場する大人気キャラ！！",
                                  maxLines: 3,
                                  style: BaseTextStyles.plainCharacterBlue,
                                  textAlign: TextAlign.center,
                                ).safeText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Image.asset("image/kcschann_standing.png", fit: BoxFit.fitHeight,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
              child: Container(
                height: deviceInfo.size.height / 2 - 64 - 30,
                child: Card(
                  color: Color(0xFFE6EE9C),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Image.asset("image/kcsdragon.png", fit: BoxFit.fitHeight,),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  "KCSドラゴン",
                                  maxLines: 1,
                                  style: BaseTextStyles.h2CharacterRed,
                                ).safeText(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: AutoSizeText(
                                  "たまに出番がある",
                                  maxLines: 3,
                                  style: BaseTextStyles.plainCharacterRed,
                                ).safeText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}