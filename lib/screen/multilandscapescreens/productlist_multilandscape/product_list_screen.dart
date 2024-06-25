import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/bloc/product_list_bloc.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/cart_badge.dart';
import 'package:watch_store_app/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.param});
  final param;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final productListBloc = ProductListBloc(productRepository);
        //add کردن event
        productListBloc.add(ProductListInit(param: param));
        return productListBloc;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartBadge(
                  count: 1,
                ),
                Row(
                  children: [
                    Text("پرفروش ترین ها"),
                    SvgPicture.asset(Assets.svg.sort),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close))
              ],
            )),
            body: Column(
              children: [
                TagList(),
                BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state is ProductListLoading) {
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    } else if(state is ProductListLoaded){
                       return Expanded(
                      child: GridView.builder(
                        itemCount: state.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                          // mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) =>
                            ProductItem(
                             id: state.productList[index].id,
                              productName: state.productList[index].title,
                              discount: state.productList[index].discount,
                              oldPrice:state.productList[index].discountPrice ,
                              specialExpiration: state.productList[index].specialExpiration,                             
                              price: state.productList[index].price,),
                      ),
                    );
                    }else if(state is ProductListError){
                      return Text("Error");
                    }else{
                      throw Exception("invalid State");
                    }
                   
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
              margin: EdgeInsets.symmetric(horizontal: AppDimens.small),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(AppDimens.large),
              ),
              child: Text(
                "نیوفورس",
                style: AppTextStyles.tagTitle,
              ),
            );
          },
        ),
      ),
    );
  }
}
