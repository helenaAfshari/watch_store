
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/basketscreen/basket_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/basketscreen/tablet_basket_screen.dart';

class MultyLandScapeBasketScreen extends StatelessWidget {
  const MultyLandScapeBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide >
            AppDimens.minTabletSize)
        ? const TabletBasketScreen()
        : const BasketScreen();
  }
}