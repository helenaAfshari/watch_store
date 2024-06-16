import 'package:flutter/material.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';

class Avatar extends StatelessWidget {
   Avatar({super.key,required this.onTap,required this.file});
  final onTap;
  final file;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
              width: size.width * .2,
        height: size.height * .2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child:file==null? Image.asset(Assets.png.avatar.path):Image.file(file),
            ),
          ),
          AppDimens.medium.height,
          const Text(AppStrings.chooseProfileImage,style: AppTextStyles.avatarText,),
        ],
      ),
    );
  }
}