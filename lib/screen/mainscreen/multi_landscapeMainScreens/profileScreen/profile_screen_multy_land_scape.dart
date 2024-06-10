
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/mainscreen/main_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/mainscreen/tablet_main_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/profileScreen/tablet_profile_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/profileScreen/profile_screen.dart';

class MultyLandScapeProfileScreen extends StatelessWidget {
  const MultyLandScapeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide>
    AppDimens.minTabletSize)?const TabletProfileScreen():ProfileScreen();
  }
}
