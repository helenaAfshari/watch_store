
import 'package:flutter/material.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_text_field.dart';
import 'package:watch_store_app/widgets/main_button.dart';

class GetOtpScreen extends StatelessWidget {
   GetOtpScreen({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
           Text(AppStrings.otpCodeSendFor.replaceAll(AppStrings.replace, "09234"),
           style:AppTextStyles.title,),
             AppDimens.small.height,
           Text(AppStrings.wrongNumberEditNumber),
         
           AppDimens.large.height,
           AppTextField(
            prefixLable: "2:56",
            lable: AppStrings.enterVerificationCode, hint: AppStrings.hintVerificationCode, 
           controller: _controller),
           MainButton(
            text: AppStrings.next,
            onPressed:() => Navigator.pushNamed(context,ScreenNames.registerScreen),
           ),
          ],
        ),
      ),
      ),
    );
  }
}