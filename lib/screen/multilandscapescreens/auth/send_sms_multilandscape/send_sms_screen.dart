import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/widgets/app_text_field.dart';
import 'package:watch_store_app/widgets/main_button.dart';

class SendSmsScreen extends StatelessWidget {
  SendSmsScreen({super.key});
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
              AppDimens.large.height,
              AppTextField(
                  lable: AppStrings.enterYourNumber,
                  hint: AppStrings.hintPhoneNumber,
                  controller: _controller),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is SendState){
                     Navigator.pushNamed(context, ScreenNames.verifyCodeScreen,
                     arguments: state.mobile);
                  }else if(state is ErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(microseconds: 800),
                      backgroundColor: Colors.red,
                      content: Text("خطا"),
                    
                    ));
                  }
                },
                builder: (context, state) {
                  if(state is LoadingState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MainButton(
                    text: AppStrings.next,
                    onPressed: () {
                      //از طریق پرووایدر باید به اون فانکشن دسترسی داشته باشیم
                      //داخل لیستنر گفتم که بره صفحه بعد یا خطا خورد 
                     BlocProvider.of<AuthCubit>(context).sendSms(_controller.text);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
