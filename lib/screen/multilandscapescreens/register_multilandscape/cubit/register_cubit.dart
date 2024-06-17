import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/user.dart';
import 'package:watch_store_app/utils/shared_prefrences_key_constants.dart';
import 'package:watch_store_app/utils/shared_prefrences_managment.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  // pickTheLocation({required context})async{
  //  await showSimplePickerLocation(
  //   isDismissible: true,
  //   title: "انتخاب موقعیت مکانی",
  //   textCancelPicker: "لغو",
  //   textConfirmPicker: "انتخاب",
  //   zoomOption: ZoomOption(initZoom: 8),
  //   //اینو تو نقشه میتونه کاربر انتخاب کنه و لوکیشنش رو ثبت کند
  //   // initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),

  //   //ولی ما اینجا میخواییم به صورت دستی ست کنیم پس از این گزینه استفاده میکنیم
  //   //طول و عرض جغرافیایی همیشه یک عدد دابل هست 
  //   initPosition: GeoPoint(
  //   latitude: 47.4358055, 
  //   longitude: 8.4737324),
  //   radius: 8.0,
  //   context: context).then((value) => 
  //   emit(LocationPickedState(location: value)) );
  // }

  //باید تمام فیلدها را پر کنیم و بفرستیم به سرور 
  //این برای دکمه ادامه هست 
  register({required User user})async{
   emit(LoadingState());
   try{
   //اینجا توکن را میگیریم چون که باید رجیستر صورت بگیره 
   String? token = SharedPrefrencesManager().getString(SharedPrefrencesConstants.token);
   //این Authorization
   //از سرور کپی کردیم تو سویگر زمانی که روی ایکون قفل کلیک میکنیم میگه نام و به صورت barear
   //نامی که بابت این هدر آپشن داریم Authorization
   _dio.options.headers['Authorization'] = "Bearer $token";
   //به این ادرس درخواست میزنیم 
   await _dio.post(Endpoints.register,
   //اینجا حالا به صورت فرم دیتا یوزر رو تو مپ کنیم به صورت فرم دیتا بفرستیمش سمت سرور
   //چون در سویگر به صورت form-data فرستاده شده
   //ما هم باید به صورت formData بفرستیم
   data: FormData.fromMap(user.toMap()),
   
   )
   //اینجا نوشتیم .then
   //پاسخی که به ما برمیگرداند را سپس بهمون بده
   .then((value) {
    print(value.data);
     if(value.statusCode == 201){
      emit(OkResponseState());
     }else{
      emit(ErrorState());
     }
   });
   }catch(e){
         emit(ErrorState());

   }
  }
}
