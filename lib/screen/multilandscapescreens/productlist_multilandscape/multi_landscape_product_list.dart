import 'package:flutter/material.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/product_list_screen.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/tablet_product_list.dart';

class MultiLandScapeProductListScreen extends StatelessWidget {
  const MultiLandScapeProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return(MediaQuery.of(context).size.shortestSide) > 
    AppDimens.minTabletSize ? TabletProductList() : ProductListScreen();
  }
}