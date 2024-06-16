import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/widgets/app_text_field.dart';
import 'package:watch_store_app/widgets/main_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
late Timer _timer;
int _start = 120;

startTimer(){
  const oneSec = Duration(seconds: 1);
  _timer = Timer.periodic(oneSec, (timer) {
    setState(() {
      if(_start == 0){
      _timer.cancel();
      Navigator.of(context).pop();
    }else{
      _start--;
    }
    });
    
   });

}

//2:2
String formatTime(int sec){
  int min = sec ~/60;
  int seconds = sec % 60;
  //دوتا کاراکتر بیاد سمت چپ
  String minStr = min.toString().padLeft(2,"0");
  String secondsStr = seconds.toString().padLeft(2,"0");
  return '$minStr:$secondsStr';
}
  @override
  Widget build(BuildContext context) {
    //modalRoute
    //میتونیم به تنظیمات روتینگمون دسترسی داشته باشیم
    //با as میگیم که اون ارگومنت از چه جنسی هست برای ما استرینگ هست
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, mobileRouteArg),
                style: AppTextStyles.title,
              ),
              AppDimens.small.height,
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                child: Text(AppStrings.wrongNumberEditNumber)),
              AppDimens.large.height,
              AppTextField(
                  prefixLable: formatTime(_start),
                  lable: AppStrings.enterVerificationCode,
                  hint: AppStrings.hintVerificationCode,
                  controller: _controller),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  _timer.cancel();
                if(state is VerifiedNotRegistredState){
                  Navigator.pushNamed(context, ScreenNames.registerScreen);
                }else if(state is VerifiedIsRegistredState){
              Navigator.pushNamed(context, ScreenNames.mainScreen);
                }

                },
                builder: (context, state) {
                  if(state is LoadingState){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    return MainButton(
                    text: AppStrings.next,
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).verifyCode(mobileRouteArg, _controller.text);
                    });
                  }
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
