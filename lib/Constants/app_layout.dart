import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    final x = getScreenHeight()*(pixels/856.7272727272727);
    return x;
  }

  static getWidth(double pixels) {
    final x = getScreenWidth()*(pixels/392.72727272727275);
    return x;
  }
}


class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}