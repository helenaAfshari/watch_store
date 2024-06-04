
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/btm_nav_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double btmNavHeight = size.height*.1;
    return SafeArea(
      child: Scaffold(
        body: Stack(
        children: [
             Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: btmNavHeight,
          child: Container(
            color: Colors.red,
            height: btmNavHeight,
          )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
          child: Container(
            color: AppColors.btmNavColor,
            height: btmNavHeight,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BtmNavItem(
              iconSvgPath: Assets.svg.user, 
              text: AppStrings.profile, 
              isActive: false, 
              onTap: () {
                
              },),
              BtmNavItem(
              iconSvgPath: Assets.svg.cart, 
              text: AppStrings.basket, 
              isActive: false, 
              onTap: () {
                
              },),
              BtmNavItem(
              iconSvgPath: Assets.svg.home, 
              text: AppStrings.home, 
              isActive: true, 
              onTap: () {
                
              },),
            ]),
          )),
        ],)
      ),
    );
  }
}
