

//singletoon class
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesManager{

  SharedPreferences? _prefrences;

  //این درواقع یک singletoon میسازد
  SharedPrefrencesManager._privateConstrator();
  
  static final SharedPrefrencesManager _instants = 
  SharedPrefrencesManager._privateConstrator();

  //factory با استفاده 
  //میتونیم یک اینستنسی را میسازد که نیاز من به ساخت مستقیم کلاس را رفع میکند
  factory SharedPrefrencesManager(){
    return _instants;
  }
   //// تا قسمت بالا کلاس سینگلتون را ساختیم
   ///حالا از این جا به پایین کد ها میگیم چه کاری میخواییم در این کلاس انجام بدیم
   
   Future<void> init()async{
    _prefrences = await SharedPreferences.getInstance();
   }

  ///key یک کلید میخواد که داده های مورد نظرمون را بنویسیم و
  ///یک value میخواد
  ///اینجا ذخیره میکنیم اطلاعات رو در شریدپریفرنس
   Future<void> saveString(String key,String value)async{
     await _prefrences?.setString(key, value);
   }
      Future<void> saveInt(String key,int value)async{
     await _prefrences?.setInt(key, value);
   }
      Future<void> saveBool(String key,bool value)async{
     await _prefrences?.setBool(key, value);
   }


///اینجا باید بعدش که ذخیره کردیم بخوانیم اطلاعات روکه کال کنیم و به همراه  ایی پی آیی بفرستم به سرور
//با استفاده از این کلید مثلا هرچی که در توکن هست را به ما برگردون
String? getString(String key){
  return _prefrences?.getString(key);
}

int? getInt(String key){
  return _prefrences?.getInt(key);
}
bool? getBool(String key){
  return _prefrences?.getBool(key);
}

Future<void> remove(String key)async{
  await _prefrences?.remove(key);
}
}