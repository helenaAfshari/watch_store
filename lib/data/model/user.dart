
import 'dart:convert';

class User{
  final String name;
  final String phone;
  final String address;
  final String postalCode;
  final  image;
  final double lat;
  final double lng;

  User({
    required this.name,
    required this.phone,
    required this.address,
    required this.postalCode,
    required this.image,
    required this.lat,
    required this.lng,
  });


//یک مپ نوشتیم که برای سرور قابل خواندن هست 
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'phone':phone,
      'address':address,
      'postal_code':postalCode,
      'image':image,
      'lat':lat,
      'lng':lng,
    };
  }

  //و اگر احتیاج داشتیم که از یک جیسون در واقع یک آبجکت بسازم باید بنویسیم
  factory User.fromJson(String? jsonString){

    //باید اول تبدیل به مپ کنیم و بعد با کلید هاش دیتارا بخونیم  و بعد داخل کانستراکتور قرار بدیم 
    Map<String,dynamic>map = jsonDecode(jsonString!);

    return User(
      //اینجا با کلیدهاش دیتارا میخونیم
      name: map['name'], 
      phone: map['phone'], 
      address: map['address'], 
      postalCode: map['postal_code'],
      image: map['image'], 
      lat: map['lat'], 
      lng: map['lng']);
  }
}