import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';

const TextStyle _h1 = TextStyle(
  fontFamily: "MPlus",
  fontWeight: FontWeight.w300,
  fontSize: 72,
  color: Colors.white,
  letterSpacing: -0.15
);

const TextStyle _h1mobile = TextStyle(
    fontFamily: "MPlus",
    fontWeight: FontWeight.w300,
    fontSize: 60,
    color: Colors.white,
);

const TextStyle _normal = TextStyle(
    fontFamily: "MPlus",
    fontSize: 16,
    color: Color(0xDEFFFFFF),
  height: 2.0,
  letterSpacing: 0.5
);

const TextStyle _h2 = TextStyle(
    fontFamily: "MPlus",
    fontSize: 40,
    color: Colors.white,
  letterSpacing: -0.5
);

const TextStyle _h2character = TextStyle(
  fontFamily: "Anzu",
  fontSize: 60,
  color: Colors.blue,
  letterSpacing: -0.5
);

const TextStyle _plaincharacter = TextStyle(
    fontFamily: "Anzu",
    fontSize: 30,
    color: Colors.blue,
    letterSpacing: -0.5
);

const TextStyle _h4 = TextStyle(
  fontFamily: "MPlus",
  fontSize: 34,
  color: Color(0xDEFFFFFF), //87%
  letterSpacing: 0.25
);

const TextStyle _subTitle1 = TextStyle(
  fontFamily: "MPlus",
  fontSize: 16,
  color: Color(0x99FFFFFF), //60%
  letterSpacing: 0.15,
);

const TextStyle _qasummary = TextStyle(
  fontFamily: "MPlus",
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color(0xDEFFFFFF),
  letterSpacing: 0.5,
  height: 2
);

const TextStyle _button = TextStyle(
  fontFamily: "MPlus",
  fontSize: 14,
  color: Color(0xDEFFFFFF),
  letterSpacing: 1.25,
);

const TextStyle _question = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Color(0xDE90CAF9),
  letterSpacing: 0.5
);

class BaseTextStyles {
  static TextStyle h1(DeviceInfo info) => info.device == Device.PC ? _h1 : _h1mobile;
  static TextStyle get h2 => _h2;
  static TextStyle get h4 => _h4;
  static TextStyle get subtitle1 => _subTitle1;
  static TextStyle get plain => _normal;
  static TextStyle get qasummary => _qasummary;
  static TextStyle get button => _button;
  static TextStyle get question => _question;

  static TextStyle h1Tint(DeviceInfo info, {Color tint}) => tint == null
      ? h1(info)
      : h1(info).merge(TextStyle(color: tintColor(_h2.color, tint)));
  static TextStyle h2Tint({Color tint}) => tint == null
      ? _h2
      : _h2.merge(TextStyle(color: tintColor(_h2.color, tint)));
  static TextStyle h4Tint({Color tint}) => tint == null
      ? _h4
      : _h4.merge(TextStyle(color: tintColor(_h4.color, tint)));
  static TextStyle plainTint({Color tint}) => tint == null
      ? _normal
      : _normal.merge(TextStyle(color: tintColor(_normal.color, tint)));
  static TextStyle subtitle1Tint({Color tint}) => tint == null
      ? _subTitle1
      : _subTitle1.merge(TextStyle(color: tintColor(_subTitle1.color, tint)));
  static TextStyle buttonTint({Color tint}) => tint == null
      ? _button
      : _button.merge(TextStyle(color: tintColor(_button.color, tint)));

  static TextStyle get h2CharacterBlue => _h2character.merge(TextStyle(color: Colors.blue));
  static TextStyle get h2CharacterRed => _h2character.merge(TextStyle(color: Colors.red));
  static TextStyle get plainCharacterBlue => _plaincharacter.merge(TextStyle(color: Colors.blue));
  static TextStyle get plainCharacterRed => _plaincharacter.merge(TextStyle(color: Colors.red));


  static TextStyle appBarMenuText(Color color) => TextStyle(
    color: color,
    fontFamily: "MPlus"
  );

  static Color tintColor(Color from, Color tint) {
    return Color((0xFF000000 & from.value) + (0x00FFFFFF & tint.value));
  }
}