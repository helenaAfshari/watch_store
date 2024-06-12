import 'package:flutter/material.dart';
import 'package:watch_store_app/component/themes.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/route/routes.dart';
import 'package:watch_store_app/screen/get_otp_screen.dart';
import 'package:watch_store_app/screen/mainscreen/product_list_screen.dart';
import 'package:watch_store_app/screen/register_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      title: 'Flutter Demo',
      home: ProductListScreen(),
      // initialRoute: ScreenNames.root,
      // routes: routes,
    );
  }
}
