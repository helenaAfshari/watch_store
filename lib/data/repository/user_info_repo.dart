
import 'package:watch_store_app/data/model/adress.dart';
import 'package:watch_store_app/data/model/order.dart';
import 'package:watch_store_app/data/model/user_info.dart';
import 'package:watch_store_app/data/src/user_info_src.dart';

abstract class IUserRepository {
  Future<UserInfo>getUserInfo();
  Future<Address>getUserAddresses();
  Future<Order> userReceivedOrders();
  Future<Order> userCancelledOrders();
  Future<Order> userProcessingOrders();
}

class UserRepository implements IUserRepository{
  final IUserDataSrc _dataSrc;

  UserRepository(this._dataSrc);
  @override
  Future<Address> getUserAddresses() => _dataSrc.getUserAddresses();

  @override
  Future<UserInfo> getUserInfo() => _dataSrc.getUserInfo();

  @override
  Future<Order> userCancelledOrders() => _dataSrc.userCancelledOrders();

  @override
  Future<Order> userProcessingOrders() => _dataSrc.userProcessingOrders();

  @override
  Future<Order> userReceivedOrders() => _dataSrc.userReceivedOrders();

}