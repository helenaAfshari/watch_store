import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/cart_multilandscape/bloc/cart_bloc.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //اینجا میزاریم که هر زمان کلیک کردیم رفت صفحه بعدی همون موقع آپدیت کنه صفحه رو
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());

    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.basket,
              style: AppTextStyles.title,
            ),
          ),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: AppDimens.medium),
            padding: EdgeInsets.all(AppDimens.medium),
            height: size.height * .1,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 3)
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.leftArrow)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.sendToAddress,
                        style: AppTextStyles.caption,
                      ),
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
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
             if (state is CartLoadedState) {
                return CartList(list: state.userCart.cartList);
             } 
             else if(state is CartItemAddedState) {
               return CartList(list: state.userCart.cartList);
             }
             
             else if(state is CartItemDeletedState) {
               return CartList(list: state.userCart.cartList);
             }
             
             else if(state is CartItemRemovedState) {
               return CartList(list: state.userCart.cartList);
             }   
             else if(state is CartErrorState) {
               return Text("error");
             }
              else if(state is CartLoadingState) {
               return LinearProgressIndicator();
             }else{
             return CircularProgressIndicator();
             }
            },
          ),
          BlocConsumer<CartBloc,CartState>(
            builder: (context, state) {
              //زمانی که بخواییم مرتب تر بنویسیم که مثل بالایی else if های مختلف ننویسیم و  از همونا استفاده کنیم 
              // از همونا استفاده کنیم به این شکل مینویسیم 
            UserCart? userCart;
            //با این نوع نوشتن در نهایت ما userCart رو میخواییم
            switch (state.runtimeType) {
              case CartLoadedState:
              case CartItemAddedState:
              case CartItemDeletedState:
              case CartItemRemovedState:
              //اینجا داینامیک نوشتیم برای این که همه چهارتا استیت بالایی هارو شامل شود 
                userCart = (state as dynamic).userCart;
                break;
                case CartErrorState:
                return Text("error");
                 case CartLoadingState:
                return LinearProgressIndicator();
              default:
              return SizedBox();
            }
            // از visibility استفاده شده
            //که اگر چیزی داخل سبد خرید نبود دکمه نمایش داده نشود
            return Visibility(
              visible: (userCart?.cartTotalPrice??0)>0,
              child: GestureDetector(
                onTap: () => BlocProvider.of<CartBloc>(context).add(PayEvent()),
                child: Container(
                  padding: EdgeInsets.all(AppDimens.medium),
                  margin: EdgeInsets.all(AppDimens.medium),
                 decoration:const BoxDecoration(
                  color: AppColors.surfaceColor,
                  borderRadius: BorderRadius.all( Radius.circular(AppDimens.medium)),
                 ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.svg.leftArrow),
                    Column(
                      children: [
                        Text("قیمت: ${userCart?.cartTotalPrice.separateWithComma} تومان",style: AppTextStyles.caption,),
                        Visibility(
                          visible: userCart?.totalWithoutDiscountPrice!=userCart?.cartTotalPrice,
                          child: Text("با تخفیف: ${userCart?.totalWithoutDiscountPrice.separateWithComma} تومان",style: AppTextStyles.caption.copyWith(
                            color: Colors.red,
                          ),),
                        )
                      ],
                    )
                  ],
                  ),
                ),
              ));
          }, listener: (context, state) async {
            
            if(state is RecivedPayLinkState){
              final Uri url = Uri.parse(state.url);
              if(!await launchUrl(url)){
             throw Exception('Could not Launch $url');
              }
            }
          },)
        ]),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  List<CartModel> list;
   CartList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
      itemBuilder: (context, index) {
        return ShopingCartItem(
          // oldPrice: 5000000,
          // price: 1000000,
        cartModel: list[index],
        );
      },
    ));
  }
}
