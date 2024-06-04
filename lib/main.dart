import 'package:flutter/material.dart';
import 'package:watch_store_app/component/themes.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/route/routes.dart';


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
      // home: RegisterScreen(),
      initialRoute: ScreenNames.root,
      routes: routes,

    );
  }
}
