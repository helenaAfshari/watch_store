
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(child: 
   Scaffold(
    appBar: CustomAppBar(child: Align(alignment: Alignment.centerRight,
    child: Text(AppStrings.basket,
    style: AppTextStyles.title,),
    ),),
    body: Column(children: [
      Container(
        margin: EdgeInsets.only(top: AppDimens.medium),
        padding: EdgeInsets.all(AppDimens.medium),
        height: size.height* .1,
        width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0, 3),blurRadius: 3 )]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {
            
          }, icon: SvgPicture.asset(Assets.svg.leftArrow)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppStrings.sendToAddress,style: AppTextStyles.caption,),
                FittedBox(
                  child: Text(
                    AppStrings.lurem,
                    style: AppTextStyles.caption,
                   
                    ),
                ),
              ],
            ),
          )
        ],
      ),
      )
    , Expanded(
      child: ListView.builder(
      itemBuilder: (context, index) {
        return ShopingCartItem(
          oldPrice: 5000000,
          price: 1000000,
          productTitle:"ساعت شیاومی " ,
        );
      },)),
      Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
      )
    ]),
    ),);
  }
}

