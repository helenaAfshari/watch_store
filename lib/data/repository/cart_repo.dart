
import 'package:flutter/material.dart';
import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/data/src/cart_data_src.dart';

// abstract class ICartRepository{
//   Future<List<CartModel>>getUserCart();
//   //در سویگر چون پروداکت ایدی شو میخواد از ما میگیره که براساس اون ایدی اضافه کنیم به سبد خرید
//   //چون چیزی قرار نیست برگرده و فقط یک عملیات اضافه کردن صورت میگیره پس ووید میزاریم چیزی برنگرداند
//   Future<int> addToCart({required int productId});
//   Future<void> removeFromCart({required int productId});
//   Future<int> deleteFromCart({required int productId});
//   Future<int> countCartItems();

// }


// class CartRepo implements ICartRepository{
//   final ICartDataSrc _iCartDataSrc;
//   ValueNotifier<int> cartCount = ValueNotifier(0);
//   CartRepo(this._iCartDataSrc);
  
//   @override
//   Future<int> addToCart({required int productId})=>
//   _iCartDataSrc.addToCart(productId: productId).then((value) => cartCount.value=value);
  
//   @override
//   Future<int> deleteFromCart({required int productId}) => 
//   _iCartDataSrc.deleteFromCart(productId: productId).then((value) => cartCount.value=value);
  
//   @override
//   Future<List<CartModel>> getUserCart() =>_iCartDataSrc.getUserCart();
//   @override
//   Future<void> removeFromCart({required int productId}) =>_iCartDataSrc.removeFromCart(productId: productId);
  
//   @override
//   Future<int> countCartItems() =>_iCartDataSrc.countCartItems().then((value) => cartCount.value=value);

// }

// final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));

abstract class ICartRepository {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> countCartItems();
  Future<String> payCart();
}

class CartRepo implements ICartRepository {
  final ICartDataSrc _cartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);
  CartRepo(this._cartDataSrc);

  @override
  Future<UserCart> addToCart({required int productId}) =>
      _cartDataSrc.addToCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length;
        return value;
      });

  @override
  Future<UserCart> deleteFromCart({required int productId}) =>
      _cartDataSrc.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length;
        return value;
      });
  @override
  Future<UserCart> getUserCart() => _cartDataSrc.getUserCart();

  @override
  Future<UserCart> removeFromCart({required int productId}) =>
      _cartDataSrc.removeFromCart(productId: productId);

  @override
  Future<int> countCartItems() =>
      _cartDataSrc.countCartItems().then((value) => cartCount.value = value);

  @override
  Future<String> payCart() => _cartDataSrc.payCart();
}

final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));