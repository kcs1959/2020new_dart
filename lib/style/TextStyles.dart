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

class BaseTextStyles {
  static TextStyle h1(DeviceInfo info) => info.device == Device.PC ? _h1 : _h1mobile;
  static TextStyle get h2 => _h2;
  static TextStyle get h4 => _h4;
  static TextStyle get subtitle1 => _subTitle1;
  static TextStyle get plain => _normal;
  static TextStyle get qasummary => _qasummary;
  static TextStyle get button => _button;
}