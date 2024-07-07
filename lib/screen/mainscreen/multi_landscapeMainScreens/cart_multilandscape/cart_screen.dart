import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
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
              return ElevatedButton(
              onPressed: () {
            BlocProvider.of<CartBloc>(context).add(CartInitEvent());
              }, 
              child: Text("تلاش مجدد"));
             }
            },
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white,
          )
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
