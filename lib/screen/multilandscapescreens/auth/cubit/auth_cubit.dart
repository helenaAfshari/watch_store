import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/utils/shared_prefrences_key_constants.dart';
import 'package:watch_store_app/utils/shared_prefrences_managment.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){
    //checked token
    //isStore == true => login
    // emit(LoggedInState());
    //isStore = false => logout
    // emit(LoggedOutState());
    emit(LoggedOutState());
  }

  Dio _dio = Dio();
  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      //then
      //value رو به ما برمیگرداند 
      //value کل ریسپانسی هست که از سمت سرور به ما برمیگرداند
      //mobile که نوشتیم رو باید از سویگر کپی کنیم چون فقط موبایل بود و ما هم پاس دادیم به موبایل با دو نقطه  
     await _dio.post(Endpoints.sendSms,data: {"mobile":mobile})
     .then((value){
       debugPrint(value.toString());
       if(value.statusCode == 201){       
        emit(SendState(mobile: mobile));
       }else{
        emit(ErrorState());
       }
     } );
    }catch(e){
   emit(ErrorState());

    }
  }

   verifyCode(String mobile,String code) async {
    emit(LoadingState());
    try {
      //then
      //value رو به ما برمیگرداند 
      //value کل ریسپانسی هست که از سمت سرور به ما برمیگرداند
      //mobile که نوشتیم رو باید از سویگر کپی کنیم چون فقط موبایل بود و ما هم پاس دادیم به موبایل با دو نقطه  
     await _dio.post(Endpoints.checkSmsCode,data: {"mobile":mobile,"code":code})
     .then((value){
       debugPrint(value.toString());
       if(value.statusCode == 201){
        SharedPrefrencesManager().saveString(SharedPrefrencesConstants.token,value.data["data"]["token"] );


          //اینجا در سرور این رجیستر زیر مجموعه دیتا هست برا همین اینجوری مینویسیم
        if (value.data["data"]["is_registered"]) {
          emit(VerifiedIsRegistredState());
        } else {
          emit(VerifiedNotRegistredState());
        }
       }else{
        emit(ErrorState());
       }
     } );
    }catch(e){
   emit(ErrorState());

    }
  }

  registration()async{
    
  }
  logOut(){

  }
}
