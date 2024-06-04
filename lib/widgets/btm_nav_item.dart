import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class BtmNavItem extends StatelessWidget {
  String iconSvgPath;
  String text;
  bool isActive;
  void Function() onTap;
  BtmNavItem({super.key, 
    required this.iconSvgPath,
    required this.text,
    required this.isActive,
    required this.onTap,
  });
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.btmNavColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                         SvgPicture.asset(iconSvgPath,
                         colorFilter: ColorFilter.mode(
                         isActive?AppColors.btmNavActiveItem:AppColors.btmNavInActiveItem
                         , BlendMode.srcIn) ,),
                         SizedBox(height: AppDimens.small,),
                         Text(text,style:isActive? AppTextStyles.btmNavActive:AppTextStyles.btmNavInActive,)
            ],
          ),
        ) ,
      ),
    );
  }
}