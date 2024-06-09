

import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/mainscreen/main_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscape/mainScreen/tablet_main_screen.dart';

class MultyLandScapeMainScreen extends StatelessWidget {
  const MultyLandScapeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide>
    AppDimens.minTabletSize)?const TabletMainScreen():MainScreen();
  }
}
