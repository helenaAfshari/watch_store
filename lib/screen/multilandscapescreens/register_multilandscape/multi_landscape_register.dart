import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/tablet_register.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/register_screen.dart';

class MultiLandScapeRegisterScreen extends StatelessWidget {
  const MultiLandScapeRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletRegister() : RegisterScreen();
  }
}