
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/widgets/surface_container.dart';

class ShopingCartItem extends StatelessWidget {
   ShopingCartItem(
    {super.key,
    required this.oldPrice,
    required this.productTitle,
    required this.price,
    }
    );
  int count = 0;
  final productTitle;
  final int  price;
  final int oldPrice;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: 
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("ساعت شیامی mi watch",style: AppTextStyles.productTitle.copyWith(fontSize: 12),),
                Text("ثبت ${price.separateWithComma}تومان",style: AppTextStyles.caption,),
                Text("با تخفیف ${oldPrice.separateWithComma}",style: AppTextStyles.caption.copyWith(color: AppColors.primaryColor),),
                Divider(),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      
                    }, icon:SvgPicture.asset(Assets.svg.delete),
                 
),
   //اینجا تا اونجایی که جا داره فضا خالی ایجاد میکنه
                    Expanded(child: SizedBox(),),
               IconButton(onPressed: () {
                      
                    }, icon:SvgPicture.asset(Assets.svg.minus),
),
Text("عدد$count"),
 IconButton(onPressed: () {
                      
                    }, icon:SvgPicture.asset(Assets.svg.plus),
),

                  ],
                )
              ],
            ),
          ),
          Image.asset(Assets.png.unnamed.path,height: 110,),
        ],
      ),
      );
  }
}