
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/verifycode_multilandscape/verify_code_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/verifycode_multilandscape/tablet_verify.dart';

class MultiLandScapeVerifyCodeScreen extends StatelessWidget {
  const MultiLandScapeVerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletVerifyCode() : VerifyCodeScreen();
  }
}