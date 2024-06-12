
import 'package:flutter/material.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/app_text_field.dart';
import 'package:watch_store_app/widgets/avatar.dart';
import 'package:watch_store_app/widgets/main_button.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
    TextEditingController _controllerNameLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
SafeArea(
  child: Scaffold(
    appBar: PreferredSize(
      preferredSize:Size(size.width,size.height),
     child: Container(child: Row(children: [
      IconButton(
        onPressed: () => Navigator.pop(context),
       icon: Icon(Icons.arrow_back)),
      const Text(AppStrings.register)
     ]),
     )),
  body: SizedBox(
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
          children: [
            AppDimens.large.height,

            Avatar(),
    
            AppTextField(lable: AppStrings.nameLastName, hint: AppStrings.hintNameLastName, 
            controller: _controllerNameLastName), 
             AppTextField(lable: AppStrings.homeNumber, hint: AppStrings.hintHomeNumber, 
            controller: _controllerNameLastName), 
             AppTextField(lable: AppStrings.address, hint: AppStrings.hintAddress, 
            controller: _controllerNameLastName), 
             AppTextField(lable: AppStrings.postalCode, hint: AppStrings.hintPostalCode, 
            controller: _controllerNameLastName), 
             AppTextField(lable: AppStrings.location, hint: AppStrings.hintLocation, 
            controller: _controllerNameLastName,
            icon: Icon(Icons.location_on),
            ), 
            MainButton(text: AppStrings.register, 
            onPressed: () => Navigator.pushNamed(context, ScreenNames.mainScreen),),
             AppDimens.large.height,
          ],
        ),
    ),
  ),
  ));
  }
}