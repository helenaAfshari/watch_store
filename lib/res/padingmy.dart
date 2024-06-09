
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';

class MyPaddings {
  static const loginPadding = EdgeInsets.symmetric(
    horizontal: 65,
    vertical: 40,
  );
  static const all2 = EdgeInsets.all(2);
  static const all4 = EdgeInsets.all(4);
  static var all8 = EdgeInsets.all(AppDimens.light);
  static var all12 = EdgeInsets.all(AppDimens.xLight);
  static var all24 = EdgeInsets.all(AppDimens.semiLarge);
  static var homeAppbar = EdgeInsets.fromLTRB(
    AppDimens.medium,
    AppDimens.semiLarge,
    AppDimens.medium,
    AppDimens.medium,
  );

  static var searchWidget = EdgeInsets.symmetric(
    horizontal: AppDimens.medium,
    vertical: AppDimens.light,
  );

  static var horizontal20 =
      EdgeInsets.symmetric(horizontal: AppDimens.medium + AppDimens.small);

  static var mainPageLists = EdgeInsets.only(bottom: AppDimens.xlarge * 2.5);
}
