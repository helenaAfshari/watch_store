
import 'package:flutter/material.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/get_otp_screen.dart';
import 'package:watch_store_app/screen/mainscreen/main_screen.dart';
import 'package:watch_store_app/screen/register_screen.dart';
import 'package:watch_store_app/screen/send_otp_screen.dart';

Map<String,Widget Function (BuildContext)> routes = {
 ScreenNames.root : (context) => SendOtpScreen(),
 ScreenNames.getOtpScreen : (context) => GetOtpScreen(),
 ScreenNames.registerScreen : (context) => RegisterScreen(),
 ScreenNames.mainScreen : (context) => MainScreen(),
};