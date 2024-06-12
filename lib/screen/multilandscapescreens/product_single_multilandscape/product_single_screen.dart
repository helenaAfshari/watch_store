import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
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

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
            children: [
             Image.asset(Assets.png.unnamed.path,
             fit: BoxFit.cover,
             width: MediaQuery.sizeOf(context).width,
             ),
             Container(
              margin: EdgeInsets.all(AppDimens.medium),
              width: double.infinity,
              padding: EdgeInsets.all(AppDimens.medium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.medium,),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("بنسر",style: AppTextStyles.productTitle,
                  textDirection: TextDirection.rtl,),
          
                  Text("مسواک بنسر مدل اکسترا",style: AppTextStyles.caption,
                  textDirection: TextDirection.rtl,),
                  Divider(),
                  ProductTabView(),
                  60.0.height,
                ],
              ),
             )
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.blue,
              height: 60,
              width: double.infinity,
            ),
          )
        ],
      ),
    ));
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {

  var selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width/3,
            itemCount: tabs.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            child:  Container(
              padding: EdgeInsets.all(AppDimens.medium),
            child:Text(tabs[index],style: index==selectedTabIndex? AppTextStyles.selectedTab:AppTextStyles.unSelectedTab ,) ,)
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
            Review(),
            Comments(),
            Features(),
          ],
        ),
      ],
    );
  }
}

List<String>tabs = [
  "نقدو بررسی ",
  "نظرات",
  "خصوصیات",
];

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("kkk");
  }
}
class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Review");
  }
}
class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("comment");
  }
}