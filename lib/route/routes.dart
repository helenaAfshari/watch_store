
import 'package:flutter/material.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/mainscreen/main_screen_multy_land_scape.dart';
import 'package:watch_store_app/screen/multilandscapescreens/product_single_multilandscape/multi_landscape_product_list.dart';
import 'package:watch_store_app/screen/multilandscapescreens/get_otp_multilandscape/multi_landscape_get_otp.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/multi_landscape_product_list.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/multi_landscape_register.dart';
import 'package:watch_store_app/screen/multilandscapescreens/send_otp_multilandscape/multi_landscape_send_otp.dart';

Map<String,Widget Function (BuildContext)> routes = {
 ScreenNames.root : (context) => MultiLandScapeSetOtpScreen(),
 ScreenNames.getOtpScreen : (context) => MultiLandScapeGetOtpScreen(),
 ScreenNames.registerScreen : (context) => MultiLandScapeRegisterScreen(),
 ScreenNames.mainScreen : (context) => MultyLandScapeMainScreen(),
 ScreenNames.productListScreen : (context) => const MultiLandScapeProductListScreen(),
 ScreenNames.productSingleScreen : (context) => const MultiLandScapeProductSingleScreen(),
};