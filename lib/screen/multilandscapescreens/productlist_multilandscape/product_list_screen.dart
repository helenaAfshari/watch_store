import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/cart_badge.dart';
import 'package:watch_store_app/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartBadge(count: 1,),
            Row(
              children: [
                Text("پرفروش ترین ها"),
                SvgPicture.asset(Assets.svg.sort),
              ],
            ),
            IconButton(onPressed: () {
              
            }, icon: SvgPicture.asset(Assets.svg.close))
          ],
        ) ),
        body: const Column(
          children: [
            TagList(),
            ProductGridView(),
          ],
        )
      ),
    );
  }
}


class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: AppDimens.medium),
    child: SizedBox(height: 24,
    child: ListView.builder(
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder:(context, index) {
      return  Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
        margin: EdgeInsets.symmetric(horizontal: AppDimens.small),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(AppDimens.large),
        ),
        child: Text("نیوفورس",style: AppTextStyles.tagTitle,),
      );
    },) ,),
    );
  }
}


class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
    child: GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      // mainAxisSpacing: 2,
      crossAxisSpacing: 2,
    
      ), 
      itemBuilder: (context, index) => 
      ProductItem(productName: "productName", price: 100),),
     );
  }
}