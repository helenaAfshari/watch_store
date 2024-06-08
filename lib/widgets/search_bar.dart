


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';

class SearchBarBtn extends StatelessWidget {
  const SearchBarBtn({
    required this.onTap,
    super.key,
  });
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: GestureDetector(
       onTap: onTap,
        child: Container(
         height: 52,
         width: double.infinity,
        decoration: BoxDecoration(
         color: AppColors.searchBar,
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
           BoxShadow(
             color: AppColors.shadow,
             blurRadius: 3,
             offset: Offset(0, 3)
           ),
          ]
        ),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           SvgPicture.asset(Assets.svg.search),
           Text(AppStrings.searchProduct,style: AppTextStyles.hint,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset(Assets.png.mainLogo.path),
           ),
         ],
        ),
        ),
      ),
    );
  }
}