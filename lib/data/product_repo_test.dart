
import 'package:dio/dio.dart';
import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/data/src/product_data_src.dart';

class ProductRepoTest{
  //قبلا اینجوری میگرفت چون دیو میخواست 
  // final _productRepo = ProductRepository(ProductRemoteDataSrc(Dio()));
  //این الان توکن هم چک میکنه با اینسپکتور که نوشتیم
  //که توکن داریم یا نه
  final _productRepo = ProductRepository(ProductRemoteDataSrc(DioManager.dio));
  getProduct()async => 
  await _productRepo.getSorted(ProductSortRoutes.newestProducts);
}