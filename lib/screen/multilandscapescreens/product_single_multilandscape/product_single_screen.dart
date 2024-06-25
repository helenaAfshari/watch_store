import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/model/product_details.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/product_single_multilandscape/bloc/product_single_bloc.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/cart_badge.dart';

class ProductSingleScreen extends StatelessWidget {
  final id;
  const ProductSingleScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        //با استفاده از اون دیتایی که اول برمیگردونه به ما باید بلاکمون رو بسازیم
        final productBloc = ProductSingleBloc(productRepository);
        productBloc.add(ProductSingleInit(id: id));
        return productBloc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is ProductSingleLoaded){
              return SafeArea(
              child: Scaffold(
            appBar: CustomAppBar(
                child: Row(
              children: [
                CartBadge(),
                Expanded(
                  //با این fittedBox
                  //تمام این متن رو کامل قرار میدهد
                    child: FittedBox(
                      child: Text(
                                      state.productDetailes.title??"بدون نام",
                                      style: AppTextStyles.productTitle,
                                      textDirection: TextDirection.rtl,
                                    ),
                    )),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                     icon: SvgPicture.asset(Assets.svg.close))
              ],
            )),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Image.network(
                      // Assets.png.unnamed.path,
                      state.productDetailes.image!,
                      scale: 1,
                      fit: BoxFit.cover,
                      // width: MediaQuery.sizeOf(context).width,
                    ),
                    Container(
                      margin: EdgeInsets.all(AppDimens.medium),
                      width: double.infinity,
                      padding: EdgeInsets.all(AppDimens.medium),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppDimens.medium,
                        ),
                        color: AppColors.mainBg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                           Text(
                            state.productDetailes.brand!,
                            style: AppTextStyles.productTitle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                         state.productDetailes.title!,                           
                         style: AppTextStyles.caption,
                            textDirection: TextDirection.rtl,
                          ),
                          Divider(),
                          ProductTabView(productDetailes: state.productDetailes),
                          60.0.height,
                        ],
                      ),
                    )
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  left: AppDimens.large,
                  right: AppDimens.large,
                  child: ElevatedButton(onPressed: () {
                    
                  },child: Text("افزودن به سبد خرید",style: AppTextStyles.mainbuttn,),
                  )
                )
              ],
            ),
          ),);
          }
          else if(state is ProductSingleError){
              Text("Error");
          }   
        return Text("invalid");
        },
        
      ),
    );
  }
}


class ProductTabView extends StatefulWidget {
  final ProductDetailes productDetailes;
  const ProductTabView({super.key, required this.productDetailes});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            itemCount: tabs.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(AppDimens.medium),
                  child: Text(
                    tabs[index],
                    style: index == selectedTabIndex
                        ? AppTextStyles.selectedTab
                        : AppTextStyles.unSelectedTab,
                  ),
                )),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
            Review(text: widget.productDetailes.discussion,),
            CommentsList(comments: widget.productDetailes.comments!),
            PropertiesList(properties: widget.productDetailes.properties!,),
          ],
        ),
      ],
    );
  }
}

List<String> tabs = [
  "نقدو بررسی ",
  "نظرات",
  "خصوصیات",
];

class PropertiesList extends StatelessWidget {
  final List<Properties> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //برای این که pn کنیم به scroll اصلی
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: properties.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimens.medium),
          margin: EdgeInsets.all(AppDimens.medium),
          color: AppColors.surfaceColor,
          child: Text("${properties[index].property} : ${properties[index].value}",
           style: AppTextStyles.caption,
           textAlign: TextAlign.right,
          ),

        );
      },));
  }
}

class Review extends StatelessWidget {
  final text;
  const Review({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}


class CommentsList extends StatelessWidget {
  final List<Comments> comments;
  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //برای این که pn کنیم به scroll اصلی
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: comments.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimens.medium),
          margin: EdgeInsets.all(AppDimens.medium),
          color: AppColors.surfaceColor,
          child: Text("${comments[index].user} : ${comments[index].body}",
           style: AppTextStyles.caption,
           textAlign: TextAlign.right,
          ),

        );
      },));
  }
}
