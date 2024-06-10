
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/homescreen/home_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/homescreen/tablet_home_screen.dart';

class MultyLandScapeHomeScreen extends StatelessWidget {
  const MultyLandScapeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide >
            AppDimens.minTabletSize)
        ? const TabletHomeScreen()
        : const HomeScreen();
  }
}