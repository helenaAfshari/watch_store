
import 'package:flutter/material.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/get_otp_screen.dart';
import 'package:watch_store_app/screen/mainscreen/main_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscape/mainScreen/main_screen_multy_land_scape.dart';
import 'package:watch_store_app/screen/mainscreen/product_list_screen.dart';
import 'package:watch_store_app/screen/mainscreen/product_single_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/get_otp_multilandscape/multi_landscape_get_otp.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/multi_landscape_register.dart';
import 'package:watch_store_app/screen/multilandscapescreens/send_otp_multilandscape/multi_landscape_send_otp.dart';
import 'package:watch_store_app/screen/register_screen.dart';
import 'package:watch_store_app/screen/send_otp_screen.dart';

Map<String,Widget Function (BuildContext)> routes = {
 ScreenNames.root : (context) => MultiLandScapeSetOtpScreen(),
 ScreenNames.getOtpScreen : (context) => MultiLandScapeGetOtpScreen(),
 ScreenNames.registerScreen : (context) => MultiLandScapeRegisterScreen(),
 ScreenNames.mainScreen : (context) => MultyLandScapeMainScreen(),
 ScreenNames.productListScreen : (context) => const ProductListScreen(),
 ScreenNames.productSingleScreen : (context) => const ProductSingleScreen(),
};