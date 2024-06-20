
import 'package:dio/dio.dart';
import 'package:watch_store_app/data/model/home.dart';
import 'package:watch_store_app/data/src/home_data_src.dart';

abstract class IHomeRepo{
  Future<Home>getHome();
}

class HomeRepository implements IHomeRepo{
  //چون که برام مهم نیست در ریپوزیتوری داده  چی برمیگرداند یا سرور یا دیتابیس هر کدوم فقط اینجا میخواد که دیتا رو بدم به ریپوزیتوری
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);
  @override
  Future<Home> getHome() => _homeDataSrc.getHome();
}


//موقتی هست
final homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));