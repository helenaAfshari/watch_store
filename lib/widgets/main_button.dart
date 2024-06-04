
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:watch_store_app/component/button_style.dart';
import 'package:watch_store_app/component/text_style.dart';

class MainButton extends StatelessWidget {

  final String text;
  void Function() onPressed;

    MainButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  SizedBox(
            height: size.height*.07,
            width: size.width*.75,
            child: ElevatedButton(
              style: AppButtonStyles.mainButtonStyle,
              onPressed: onPressed,
              child: Text(text,style: AppTextStyles.mainbuttn,)),
            );
  }
}