


//اینجا با استفاده از مدل هایی که ساختیم قبلا میاییم home رو میسازیم
//چون داخل سوگر یک دیتا هست که داخلش لیست های مختلفی هست  که اینجا مینویسیم چون همش برای هوم هست

import 'package:watch_store_app/data/model/banner.dart';
import 'package:watch_store_app/data/model/category.dart';
import 'package:watch_store_app/data/model/product.dart';
import 'package:watch_store_app/data/model/slide.dart';

class Home{
  List<Slide> sliders;
  List<Category> categories;
  List<Product> amazingProducts;
  List<Product> mostSellerProducts;
  List<Product> newestProducts;
  Banner banner;

  Home(
    {
      required this.sliders,
      required this.categories,
      required this.amazingProducts,
      required this.mostSellerProducts,
      required this.newestProducts,
      required this.banner,
    }
  );

  factory Home.fromJson(Map<String,dynamic> json){
    return Home(
      //اینجا چون در سویگر یک لیست هست پس از لیست میخونیم تبدیل به لیست باید کنیم
      sliders: (json['sliders'] as List<dynamic>).map((e) => Slide.fromJson(e)).toList(), 
      categories: (json['categories'] as List<dynamic>).map((e) => Category.fromJson(e)).toList(),
      amazingProducts: (json['amazing_products'] as List<dynamic>).map((e) =>Product.fromJson(e)).toList(), 
      mostSellerProducts: (json['most_seller_products'] as List<dynamic>).map((e) => Product.fromJson(e)).toList(), 
      newestProducts: (json['newest_products'] as List<dynamic>).map((e) => Product.fromJson(e)).toList(),
      banner: Banner.fromJson(json['banner'])
      );
  }
}