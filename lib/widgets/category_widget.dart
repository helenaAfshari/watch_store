
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key, 
   required this.title, 
   required this.onTap, 
   required this.colors, 
   required this.iconPath,
  });
 
 final title;
 final onTap;
 final colors;
 final iconPath;

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(AppDimens.small),
            height: size.height*.1,
            width: size.height*.1,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              colors: colors,
              ),
              borderRadius: BorderRadius.circular(AppDimens.large),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: Image.network(iconPath,)),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimens.small*.5,),
        Text(title,style: AppTextStyles.title.copyWith(fontSize: 12),),
      ],
    );
  }
}


