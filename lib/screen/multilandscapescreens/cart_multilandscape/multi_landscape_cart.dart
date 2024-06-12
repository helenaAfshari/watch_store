
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/cart_multilandscape/cart_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/cart_multilandscape/tablet_cart.dart';

class MultiLandScapeCartScreen extends StatelessWidget {
  const MultiLandScapeCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletCart() : CartScreen();
  }
}