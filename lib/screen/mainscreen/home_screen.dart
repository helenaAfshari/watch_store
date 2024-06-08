import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_slider.dart';
import 'package:watch_store_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
           SearchBarBtn(onTap: () {
             
           },),
            AppSlider(imgList: []),
            Row(
              children: [
                CategoryWidget(),
              ],
            )

          ]),
        ),
      ),
    );

  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(AppDimens.small),
          height: size.height*.1,
          width: size.height*.1,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            colors: AppColors.catClasicColors),
            borderRadius: BorderRadius.circular(AppDimens.large),
          ),
          child: SvgPicture.asset(Assets.svg.clasic),
        ),
        const SizedBox(height: AppDimens.small*.5,),
        Text(AppStrings.classic,style: AppTextStyles.title.copyWith(fontSize: 16),),
      ],
    );
  }
}


