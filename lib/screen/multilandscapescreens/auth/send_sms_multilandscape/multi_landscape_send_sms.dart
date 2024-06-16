
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/send_sms_multilandscape/send_sms_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/send_sms_multilandscape/tablet_send_sms.dart';

class MultiLandScapeSendSmsScreen extends StatelessWidget {
  const MultiLandScapeSendSmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletSendSms() : SendSmsScreen();
  }
}