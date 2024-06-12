
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/send_otp_multilandscape/tablet_send_otp.dart';
import 'package:watch_store_app/screen/multilandscapescreens/send_otp_multilandscape/send_otp_screen.dart';

class MultiLandScapeSetOtpScreen extends StatelessWidget {
  const MultiLandScapeSetOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletSendOtp() : SendOtpScreen();
  }
}