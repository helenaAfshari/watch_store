import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/cart_badge.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: CustomAppBar(
      child: 
      Row(
        children: [
          CartBadge(),
          Expanded(child: Text("productName",
          style: AppTextStyles.productTitle,
          textDirection: TextDirection.rtl,)),
          IconButton(onPressed: () {
            
          }, icon: SvgPicture.asset(Assets.svg.close))
        ],
      )
      ),

      body: Column(
      children: [
       Image.asset(Assets.png.unnamed.path,
       fit: BoxFit.cover,
       width: MediaQuery.sizeOf(context).width,
       ),
       
      ]),
    ));
  }
}