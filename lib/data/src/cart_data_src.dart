import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/utils/response_validator.dart';

// abstract class ICartDataSrc{
//   Future<List<CartModel>>getUserCart();
//   //در سویگر چون پروداکت ایدی شو میخواد از ما میگیره که براساس اون ایدی اضافه کنیم به سبد خرید
//   //چون چیزی قرار نیست برگرده و فقط یک عملیات اضافه کردن صورت میگیره پس ووید میزاریم چیزی برنگرداند
//   Future<int> addToCart({required int productId});
//   Future<void> removeFromCart({required int productId});
//   Future<int> deleteFromCart({required int productId});
//     Future<int> countCartItems();

// }


// //از دیتابیس هم میتونیم اینجا استفاده کنیم  یا اگر api هست از ریموت
// class CartRemoteDataSrc implements ICartDataSrc{
//   final Dio httpClient;
//   static const productIdJsonKey = 'product_id';
//   CartRemoteDataSrc(this.httpClient);
  
//   @override
//   Future<int> addToCart({required int productId})async => 
//   await httpClient.post(Endpoints.addToCart,data: {productIdJsonKey: productId})
//   .then((value) {
//      HttpResponseValidator.isValidStatusCode(value.statusCode??0);
//     return (value.data['data']['user_cart']as List).length;
//   });
  
//     @override
//   Future<int> deleteFromCart({required int productId})async => 
//   await httpClient.post(Endpoints.deleteFromCart,data: {productIdJsonKey: productId})
//  .then((value) {
//      HttpResponseValidator.isValidStatusCode(value.statusCode??0);
//     return (value.data['data']['user_cart']as List).length;
//   });

//  @override
//   Future<void> removeFromCart({required int productId})async => 
//   await httpClient.post(Endpoints.removeFromCart,data: {productIdJsonKey: productId})
//   .then((value) => HttpResponseValidator.isValidStatusCode(value.statusCode??0));
  
//   @override
//   Future<List<CartModel>> getUserCart() async {
//    List<CartModel> cartList= <CartModel>[];
//    final response = await httpClient.post(Endpoints.userCart);
//    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
//    for (var element in (response.data['data']['user_cart'] as List)) {
//     cartList.add(CartModel.fromJson(element));
     
//    }
//    return cartList;
//   }
  
//   @override
//   Future<int> countCartItems()async {
//    final response = await httpClient.post(Endpoints.userCart);
//    HttpResponseValidator.isValidStatusCode(response.statusCode ??0);
//    return (response.data['data']['user_cart'] as List).length;
//   }
  
// }

abstract class ICartDataSrc {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> countCartItems();
  Future<String> payCart();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpCilent;
  static const productIdJsonKey = 'product_id';
  CartRemoteDataSrc(this.httpCilent);

  @override
  Future<UserCart> addToCart({required int productId}) async =>
      await httpCilent.post(Endpoints.addToCart,
          data: {productIdJsonKey: productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return UserCart.fromJson(value.data['data']);
      });

  @override
  Future<UserCart> deleteFromCart({required int productId}) async =>
      await httpCilent.post(Endpoints.deleteFromCart,
          data: {productIdJsonKey: productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return UserCart.fromJson(value.data['data']);
      });
  @override
  Future<UserCart> removeFromCart({required int productId}) async =>
      await httpCilent.post(Endpoints.removeFromCart,
          data: {productIdJsonKey: productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return UserCart.fromJson(value.data['data']);
      });

  @override
  Future<UserCart> getUserCart() async {
    final response = await httpCilent.post(Endpoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<int> countCartItems() async {
    final response = await httpCilent.post(Endpoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }

  @override
  Future<String> payCart() async {
    final response = await httpCilent.post(Endpoints.payment);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return response.data['action'];
  }
}