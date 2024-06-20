
import 'package:dio/dio.dart';
import 'package:watch_store_app/data/model/product.dart';
import 'package:watch_store_app/data/src/product_data_src.dart';

abstract class InterfaceProductRepo{
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}


//باید imlement کنیم از این اینترفیس که بتونه داده هارو بدون توجه به این که از کجا و چه دیتاسورسی تامین میشن از دیتاسورس بگیره و اماده بکنه 
class ProductRepository implements InterfaceProductRepo{
  final IProductDataSrc _iProductDataSrc;

  ProductRepository(this._iProductDataSrc);
  
  @override
  Future<List<Product>> getAllBrand(int id) =>
   _iProductDataSrc.getAllBrand(id);
  
  @override
  Future<List<Product>> getAllByCategory(int id) =>
  _iProductDataSrc.getAllByCategory(id);
  
  @override
  Future<List<Product>> getSorted(String routeParam) =>
  _iProductDataSrc.getSorted(routeParam);
  
  @override
  Future<List<Product>> searchProducts(String searchKey) =>
  _iProductDataSrc.searchProducts(searchKey);

}


//در بلاک بیلدر بهش دسترسی داشته باشم
final productRepository = ProductRepository(ProductRemoteDataSrc(Dio()));