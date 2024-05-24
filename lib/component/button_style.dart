import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.medium))));
}
