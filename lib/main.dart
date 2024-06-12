import 'package:flutter/material.dart';
import 'package:watch_store_app/component/themes.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/route/routes.dart';
import 'package:watch_store_app/screen/multilandscapescreens/cart_multilandscape/cart_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/cart_multilandscape/multi_landscape_cart.dart';
import 'package:watch_store_app/screen/multilandscapescreens/product_single_multilandscape/multi_landscape_product_list.dart';
import 'package:watch_store_app/screen/multilandscapescreens/product_single_multilandscape/product_single_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/get_otp_multilandscape/get_otp_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/product_list_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/register_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      title: 'Flutter Demo',
      home: MultiLandScapeCartScreen(),
      // initialRoute: ScreenNames.root,
      // routes: routes,
    );
  }
}
