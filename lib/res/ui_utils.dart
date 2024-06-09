

import 'package:flutter/material.dart';

class UIUtils {
  static const double screenWidthInFigma = 390;
  static const double screenHeightInFigma = 844;

  static double getConvertedWidth(BuildContext context, double figmaWidth) {
    return MediaQuery.of(context).size.width * (figmaWidth / screenWidthInFigma);
  }

  static double getConvertedHeight(BuildContext context, double figmaHeight) {
    return (MediaQuery.of(context).size.height) * figmaHeight / screenHeightInFigma;
  }
}