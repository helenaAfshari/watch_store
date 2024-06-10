import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_slider.dart';
import 'package:watch_store_app/widgets/category_widget.dart';
import 'package:watch_store_app/widgets/product_item.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryWidget(
                colors: AppColors.catDesktopColors,
                onTap:(){

                } ,
                title: AppStrings.desktop,
                iconPath: Assets.svg.desktop,
                ),
                  CategoryWidget(
                colors: AppColors.catDigitalColors,
                onTap:(){

                } ,
                title: AppStrings.digital,
                iconPath: Assets.svg.digital,
                ),
                  CategoryWidget(
                colors: AppColors.catSmartColors,
                onTap:(){

                } ,
                title: AppStrings.smart,
                iconPath: Assets.svg.smart,
                ),
                  CategoryWidget(
                colors: AppColors.catClasicColors,
                onTap:(){

                } ,
                title: AppStrings.classic,
                iconPath: Assets.svg.clasic,
                ),
              ],
            ),

            AppDimens.large.height,
          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                       physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      shrinkWrap: true,
                      reverse: true,
                    itemBuilder: (context, index) =>
                  ProductItem(productName: "productName",price: 200,),
                    ),
                  ),
                VerticalText()
                ],
              ),
            )

          ]),
        ),
      ),
    );

  }
}



class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: 1.5,
                  child: SvgPicture.asset(Assets.svg.back)),
                  AppDimens.medium.width,
                Text(AppStrings.viewAll),
              ],
            ),
            Text("شگفت انگیز",style: AppTextStyles.amazingStyle,),
          ],
        ),
      ),
    );
  }
}