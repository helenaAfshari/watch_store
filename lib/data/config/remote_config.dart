
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_store_app/utils/shared_prefrences_key_constants.dart';
import 'package:watch_store_app/utils/shared_prefrences_managment.dart';

// و با استفاده از اینترسپتور انجام باید بدیم ما در زمان رکویست بتونیم توکن رو چک کنیم اگر نال نبود توکن رو بفرستیم میاییم یک هدر چک میکنیم که داده ایی که منحصر به خودمون هست را برگردونیم با توکن
//پس میاییم روی متد آن رکویستش توکن رو از شرید پریفرنس دریافت میکنیم در واقع یا توکن خالی هست یا تو ثبتنام گرفته است 

//یک توکن رو با اینترسپتور داریم رجیستر میکنیم که اون ایی پی اییمون با این توکن  ارسال بشه
class AuthInterceptor extends Interceptor{
  
  //ما اینجا یک توکن رو میخواییم چک کنیم و اضافش کنیم
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    String? token = SharedPrefrencesManager().getString(SharedPrefrencesConstants.token);

    if(token!=null){
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    super.onRequest(options, handler);
  }
}

//با استفاده از 
//geter بهش دسترسی داشته باشیم 
//با استفاده از ابجکت دیو به این گتری که اینجا میسازیم دسترسی داشته باشیم
class DioManager{
  static final Dio _dio = Dio();
  static Dio get dio{
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }
}