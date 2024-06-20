
import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/home.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IHomeDataSrc{
  Future<Home> getHome();
}


class HomeRemoteDataSrc implements IHomeDataSrc{
  final Dio httpClient;
  HomeRemoteDataSrc(this.httpClient);
  @override
  Future<Home> getHome() async {
    final Home _home;

    final response = await httpClient.get(Endpoints.home);
    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
    _home=Home.fromJson(response.data['data']);
    return _home;
  }

}