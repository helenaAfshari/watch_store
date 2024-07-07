
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/cart_multilandscape/bloc/cart_bloc.dart';
import 'package:watch_store_app/widgets/surface_container.dart';

class ShopingCartItem extends StatefulWidget {
   ShopingCartItem(
    {super.key,
    required this.cartModel,
    }
    );

   CartModel cartModel;

  @override
  State<ShopingCartItem> createState() => _ShopingCartItemState();
}

class _ShopingCartItemState extends State<ShopingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return SurfaceContainer(
      child: 
          // Row(
            // children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                 Text(widget.cartModel.product,style: AppTextStyles.productTitle.copyWith(fontSize: 12),),
                    // Text("ثبت ${price.separateWithComma}تومان",style: AppTextStyles.caption,),
                    // Text("با تخفیف ${oldPrice.separateWithComma}",style: AppTextStyles.caption.copyWith(
                    //   color: AppColors.primaryColor),),
                    Divider(),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                        setState(() => widget.cartModel.deleteLoading = true);

                            cartBloc.add(DeleteFromCartEvent(widget.cartModel.productId));
                        
                        },
                         icon:SvgPicture.asset(Assets.svg.delete),
                     
),
   //اینجا تا اونجایی که جا داره فضا خالی ایجاد میکنه
                        Expanded(child: SizedBox(),),
                  IconButton(onPressed: () {
                           setState(() => widget.cartModel.countLoading = true);
                            cartBloc.add(RemoveFromCartEvent(widget.cartModel.productId));
                        
                        },
                    icon:SvgPicture.asset(Assets.svg.minus),
),
widget.cartModel.countLoading?
SizedBox(height: 24,width: 24,child: CircularProgressIndicator(),): 
   Text("عدد${widget.cartModel.count}"),
IconButton(onPressed: () {
                        setState(() => widget.cartModel.countLoading = true);

                            cartBloc.add(AddToCartEvent(widget.cartModel.productId));
                        
                        },
  icon:SvgPicture.asset(Assets.svg.plus),
),

                      ],
                    ),
                    Visibility(
                    visible: widget.cartModel.deleteLoading,
                      child: const LinearProgressIndicator()),
                  ],
                ),
              ),
            // ],
          // ),
          // Image.asset(Assets.png.unnamed.path,height: 110,),
     
      );
  }
}