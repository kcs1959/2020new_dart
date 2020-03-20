import 'package:flutter/material.dart';

class DeviceInfo {
  final DisplayAspect displayAspect;
  final Device device;
  final Size size;

  DeviceInfo(this.displayAspect, this.device, this.size)
      : assert(displayAspect != null),
        assert(device != null),
        assert(size != null);

  static DeviceInfo measure(Size size) {
    DisplayAspect aspect;
    if(size.aspectRatio >= 4/3) {
      aspect = DisplayAspect.WIDE;
    }
    else if(size.aspectRatio >= 1/1) {
      aspect = DisplayAspect.NEAR_SQUARE;
    }
    else {
      aspect = DisplayAspect.PORTRAIT;
    }

    Device device;

    if(size.width > 769) {
      device = Device.PC;
    }
    else {
      device = Device.PHONE;
    }

    return DeviceInfo(aspect, device, size);
  }
}

enum DisplayAspect {
  WIDE, NEAR_SQUARE, PORTRAIT
}

enum Device {
  PC, PHONE
}
