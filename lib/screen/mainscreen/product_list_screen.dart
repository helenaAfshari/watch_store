import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(CupertinoIcons.cart),
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
        body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text("لیست محصولات")),
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSize {
   CustomAppBar(
    {
    super.key,
   required this.child,
    });
    //چون که اجباری بود حتما میخواست  child رو ما هم این جوری نوشتیم 
   @override
   final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
    preferredSize: preferredSize, 
    child: child,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}