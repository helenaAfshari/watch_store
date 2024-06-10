
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/get_otp_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/get_otp_multilandscape/tablet_get_otp.dart';

class MultiLandScapeGetOtpScreen extends StatelessWidget {
  const MultiLandScapeGetOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletGetOtp() : GetOtpScreen();
  }
}