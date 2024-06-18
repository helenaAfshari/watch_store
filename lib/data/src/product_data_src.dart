
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/product.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IProductDataSrc{
    //چون که مدل هاشون اینا تقریبا باهم یکی هست 
  Future<List<Product>> getAllCategory(int id);
  Future<List<Product>> getAllBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}


//اینجا دیتاسورس ریموت را نغریف میکنیم 
class ProductRemoteDataSrc implements IProductDataSrc{
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);
  @override
  Future<List<Product>> getAllBrand(int id) async {
   List<Product> products = <Product>[];
   final response = 
   await httpClient.get(Endpoints.productsByBrand+id.toString());
   //اینجا میخواییم validat میکنیم
   HttpResponseValidator.isValidStatusCode(response.statusCode!);
   for(var element in (response.data['all_products']['data'] as List)){
    products.add(Product.fromJson(element));
   }
   return products;
  }

  @override
  Future<List<Product>> getAllCategory(int id) async {
   List<Product> products = <Product>[];
   final response = 
   await httpClient.get(Endpoints.productsByCategory+id.toString());
   //اینجا میخواییم validat میکنیم
   HttpResponseValidator.isValidStatusCode(response.statusCode!);
   for(var element in (response.data['all_products']['data'] as List)){
    products.add(Product.fromJson(element));
   }
   return products;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
     List<Product> products = <Product>[];
   final response = 
   await httpClient.get(Endpoints.baseUrl+routeParam);
   //اینجا میخواییم validat میکنیم
   HttpResponseValidator.isValidStatusCode(response.statusCode!);
   //اینجا حتما باید پیمایش بشه و بریزه تو لیست پروداکت و برگرداند
   for(var element in (response.data['all_products']['data'] as List)){
    products.add(Product.fromJson(element));
   }
   return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
 List<Product> products = <Product>[];
   final response = 
   await httpClient.get(Endpoints.baseUrl+searchKey);
   //اینجا میخواییم validat میکنیم
   HttpResponseValidator.isValidStatusCode(response.statusCode!);
   for(var element in (response.data['all_products']['data'] as List)){
    products.add(Product.fromJson(element));
   }
   return products;
  }

}