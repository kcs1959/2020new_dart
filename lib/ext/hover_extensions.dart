import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/wid/opacityOnHover.dart';
import 'dart:html' as html;

import 'package:kcs_2020_shinkan_web/wid/translateOnHover.dart';

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final appContainer =
  html.window.document.getElementById('app-container');
  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      // When the mouse enters the widget set the cursor to pointer
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
      },
      // When it exits set it back to default
      onExit: (event) {
        appContainer.style.cursor = 'default';
      },
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(child: this,);
  }

  Widget get translucentOnHover {
    return opacityOnHover(child: this,);
  }
}