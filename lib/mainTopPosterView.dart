import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainAppBar.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/util/link.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';

const TextStyle titleStyleA = TextStyle(
    fontSize: 150.0,
    //fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: "CorporateLogo",
  height: 1.0
);

const TextStyle titleStyleB = TextStyle(
  fontSize: 100.0,
  color: Colors.white,
  fontFamily: "CorporateLogo",
  height: 1.0
);

class MainTopPosterView extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final VoidCallback toWhat, toShinkan, toWork, toQA;

  MainTopPosterView({
    Key key,
    this.deviceInfo,
    this.toWhat, this.toShinkan, this.toWork, this.toQA
  }): assert(deviceInfo != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    if(deviceInfo.device == Device.PC) {
      if(deviceInfo.displayAspect == DisplayAspect.WIDE) {
        return Container( //A+Padding
          color: Color(0xFF283593),
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  "image/topbackground.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                    aspectRatio: 4/3,
                    child: topContentA(deviceInfo.size.height, context)
                ),
              ),
              MainAppBar(
                toWhat: toWhat, toShinkan: toShinkan, toWork: toWork, toQA: toQA,
                isMobile: false,
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0x00121212),
                        const Color(0xff121212)
                      ],
                      stops: const[
                        0.0, 1.0
                      ]
                    )
                  ),
                ),
              )
            ],
          ),
        );
      }
      else if(deviceInfo.displayAspect == DisplayAspect.NEAR_SQUARE) {
        return Container( //A+Padding
          color: Color(0xFF283593),
          height: deviceInfo.size.height,
          width: deviceInfo.size.width,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  "image/topbackground.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: topContentA(deviceInfo.size.height, context),
              ),
              MainAppBar(
                toWhat: toWhat, toShinkan: toShinkan, toWork: toWork, toQA: toQA,
                isMobile: false,
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0x00121212),
                            const Color(0xff121212)
                          ],
                          stops: const[
                            0.0, 1.0
                          ]
                      )
                  ),
                ),
              )
            ],
          ),
        );
      }
      else if(deviceInfo.displayAspect == DisplayAspect.PORTRAIT) {
        return Container( //A+Padding
          color: Color(0xFF283593),
          width: deviceInfo.size.width,
          child: AspectRatio(
            aspectRatio: 1/1,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    "image/topbackground.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: topContentA(deviceInfo.size.width, context),
                ),
                MainAppBar(
                  toWhat: toWhat, toShinkan: toShinkan, toWork: toWork, toQA: toQA,
                  isMobile: false,
                ),
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0x00121212),
                              const Color(0xff121212)
                            ],
                            stops: const[
                              0.0, 1.0
                            ]
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      else {
        throw new Exception("Layout is not implemented: $deviceInfo");
      }
    }
    else if(deviceInfo.device == Device.PHONE) {
      if(deviceInfo.displayAspect == DisplayAspect.PORTRAIT) {
        return Container(
          color: Color(0xFF283593),
          width: deviceInfo.size.width,
          child: AspectRatio(
            aspectRatio: 2/3,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    "image/topbackground.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: topContentB(),
                ),
                MainAppBar(
                  toWhat: toWhat, toShinkan: toShinkan, toWork: toWork, toQA: toQA,
                  isMobile: true,
                ),
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0x00121212),
                              const Color(0xff121212)
                            ],
                            stops: const[
                              0.0, 1.0
                            ]
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      else {
        return Center(child: Text("TopContentC"),);
      }
    }

    return Container();
  }

  Widget topContentA(double height, context) {
    var iconHeight = height * 0.15;
    var positionBias = height / 1000;

    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40,left: 8, right: 8),
              child: AutoSizeText(
                  "パソコン使って\n全部やる",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: titleStyleA,
              ),
            ),
          ),
          Positioned(
              top: 280,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                  onTap: Link.toTwitterKCS,
                  child: Image.asset("image/kcschann.png", fit: BoxFit.fitHeight).showCursorOnHover
              )
          ),
          Positioned(
            bottom: 30 * positionBias, left: 100 * positionBias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/groups");
              },
              child: Container(
                  width: iconHeight, height: iconHeight,
                  child: Image.asset("image/top_web.png")
              ).showCursorOnHover.moveUpOnHover,
            ),
          ),
          Positioned(
            bottom: 450 * positionBias, left: 150 * positionBias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/groups");
              },
              child: Container(
                  width: iconHeight, height: iconHeight,
                  child: Image.asset("image/top_unity.png")
              ).showCursorOnHover.moveUpOnHover,
            ),
          ),
          Positioned(
            bottom: 280 * positionBias, left: 40 * positionBias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/groups");
              },
              child: Container(
                  width: iconHeight, height: iconHeight,
                  child: Image.asset("image/top_dtm.png")
              ).showCursorOnHover.moveUpOnHover,
            ),
          ),
          Positioned(
            bottom: 400 * positionBias, right: 130 * positionBias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/groups");
              },
              child: Container(
                  width: iconHeight, height: iconHeight,
                  child: Image.asset("image/top_blender.png")
              ).showCursorOnHover.moveUpOnHover,
            ),
          ),
          Positioned(
            bottom: 220 * positionBias, right: 50 * positionBias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/groups");
              },
              child: Container(
                  width: iconHeight, height: iconHeight,
                  child: Image.asset("image/top_ai.png")
              ).showCursorOnHover.moveUpOnHover,
            ),
          ),
        ],
      ),
    );
  }

  Widget topContentB() {
    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 50.0, left: 0, right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: AutoSizeText(
                "パソコン使って\n全部やる",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: titleStyleB,
              ),
            ),
          ),
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 16.0
                ),
                child: GestureDetector(
                  onTap: Link.toTwitterKCS,
                    child: Image.asset("image/kcschann.png", fit: BoxFit.fitWidth).showCursorOnHover
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
