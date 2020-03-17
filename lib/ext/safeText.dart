import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

extension TextExtensions on Text {
  Widget safeText() {
    if(this.textAlign == TextAlign.start) {
      return Text(
        this.data + " ",
        key: this.key,
        style: this.style,
        strutStyle: this.strutStyle,
        textAlign: this.textAlign,
        textDirection: this.textDirection,
        locale: this.locale,
        softWrap: this.softWrap,
        overflow: this.overflow,
        textScaleFactor: this.textScaleFactor,
        maxLines: this.maxLines,
        semanticsLabel: this.semanticsLabel,
        textWidthBasis: this.textWidthBasis,
      );
    }
    else if(this.textAlign == TextAlign.center) {
      return Container(
        width: double.infinity,
        child: Text(
          " " + this.data + " ",
          key: this.key,
          style: this.style,
          strutStyle: this.strutStyle,
          textAlign: this.textAlign,
          textDirection: this.textDirection,
          locale: this.locale,
          softWrap: this.softWrap,
          overflow: this.overflow,
          textScaleFactor: this.textScaleFactor,
          maxLines: this.maxLines,
          semanticsLabel: this.semanticsLabel,
          textWidthBasis: this.textWidthBasis,
        ),
      );
    }
    else {
      return Text(
        this.data + " ",
        key: this.key,
        style: this.style,
        strutStyle: this.strutStyle,
        textAlign: this.textAlign,
        textDirection: this.textDirection,
        locale: this.locale,
        softWrap: this.softWrap,
        overflow: this.overflow,
        textScaleFactor: this.textScaleFactor,
        maxLines: this.maxLines,
        semanticsLabel: this.semanticsLabel,
        textWidthBasis: this.textWidthBasis,
      );
    }
  }
}

extension AutoSizeTextExtension on AutoSizeText {
  Widget safeText() {
    return AutoSizeText(
      " " + this.data + " ",
      key: this.key,
      textKey: this.textKey,
      style: this.style,
      strutStyle: this.strutStyle,
      minFontSize: this.minFontSize,
      maxFontSize: this.maxFontSize,
      stepGranularity: this.stepGranularity,
      presetFontSizes: this.presetFontSizes,
      group: this.group,
      textAlign: this.textAlign,
      textDirection: this.textDirection,
      locale: this.locale,
      softWrap: this.softWrap,
      wrapWords: this.wrapWords,
      overflow: this.overflow,
      overflowReplacement: this.overflowReplacement,
      textScaleFactor: this.textScaleFactor,
      maxLines: this.maxLines,
      semanticsLabel: this.semanticsLabel,
    );
  }
}