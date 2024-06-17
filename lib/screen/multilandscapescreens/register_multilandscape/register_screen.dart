import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/data/model/user.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/screen/multilandscapescreens/register_multilandscape/cubit/register_cubit.dart';
import 'package:watch_store_app/utils/image_handler.dart';
import 'package:watch_store_app/widgets/app_bar.dart';
import 'package:watch_store_app/widgets/app_text_field.dart';
import 'package:watch_store_app/widgets/avatar.dart';
import 'package:watch_store_app/widgets/main_button.dart';

// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController _controllerNameLastName = TextEditingController();

//   ImageHandler imageHandler = ImageHandler();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size(size.width, size.height),
//           child: Container(
//             child: Row(children: [
//               IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Icon(Icons.arrow_back)),
//               const Text(AppStrings.register)
//             ]),
//           )),
//       body: SizedBox(
//         width: double.infinity,
//         child: SingleChildScrollView(
//           child: BlocProvider(
//             create: (context) => RegisterCubit(),
//             child: Column(
//               children: [
//                 AppDimens.large.height,
//                 Avatar(
//                     onTap: () async => await imageHandler
//                         .pickedCropImage(source: ImageSource.gallery)
//                         .then((value) => setState(() {})),
//                     file: imageHandler.getImage),
//                 AppTextField(
//                     lable: AppStrings.nameLastName,
//                     hint: AppStrings.hintNameLastName,
//                     controller: _controllerNameLastName),
//                 AppTextField(
//                     lable: AppStrings.homeNumber,
//                     hint: AppStrings.hintHomeNumber,
//                     controller: _controllerNameLastName),
//                 AppTextField(
//                     lable: AppStrings.address,
//                     hint: AppStrings.hintAddress,
//                     controller: _controllerNameLastName),
//                 AppTextField(
//                     lable: AppStrings.postalCode,
//                     hint: AppStrings.hintPostalCode,
//                     controller: _controllerNameLastName),
//                 BlocConsumer<RegisterCubit, RegisterState>(
//                   listener: (context, state) {

//                   },
//                   builder: (context, state) {
//                     return GestureDetector(
//                       onTap: () {
//                         //اینجا context
//                         //رو ما  نمیتونیم از بیلد کانتکس بگیریم چون باید از جنس پیکد لوکیشن باشه نه بیلد کانتکس
//                          //حالا اینجا کانتکس که برای کانسومر هست را میگیریم
//                         BlocProvider.of<RegisterCubit>(context)
//                             .pickTheLocation(context: context);
//                       },
//                       child: AppTextField(
//                         lable: AppStrings.location,
//                         hint: AppStrings.hintLocation,
//                         controller: _controllerNameLastName,
//                         icon: Icon(Icons.location_on),
//                       ),
//                     );
//                   },
//                 ),
//                 MainButton(
//                   text: AppStrings.register,
//                   onPressed: () =>
//                       Navigator.pushNamed(context, ScreenNames.mainScreen),
//                 ),
//                 AppDimens.large.height,
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }



class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _controllerNameLastName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerPostalCode = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // appBar: RegisterationAppBar(size: size),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => RegisterCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppDimens.large.height,
                    Avatar(
                        onTap: () async => await imageHandler
                            .pickedCropImage(source: ImageSource.gallery)
                            .then((value) => setState(() {})),
                        file: imageHandler.getImage),
                    AppTextField(
                        lable: AppStrings.nameLastName,
                        hint: AppStrings.hintNameLastName,
                        controller: _controllerNameLastName),
                    AppTextField(
                        lable: AppStrings.homeNumber,
                        hint: AppStrings.hintHomeNumber,
                        controller: _controllerPhone),
                    AppTextField(
                        lable: AppStrings.address,
                        hint: AppStrings.hintAddress,
                        controller: _controllerAddress),
                    AppTextField(
                        lable: AppStrings.postalCode,
                        hint: AppStrings.hintPostalCode,
                        controller: _controllerPostalCode),
                        AppTextField(
                            lable: AppStrings.location,
                            hint: AppStrings.hintLocation,
                            controller: _controllerLocation,
                            icon: const Icon(Icons.location_on),
                          ),
                    // BlocConsumer<RegisterCubit, RegisterState>(
                    //   listener: (context, state) {
                    //     if (state is LocationPickedState) {
                    //       if (state.location != null) {
                    //         _controllerLocation.text =
                    //             '${state.location!.latitude} - ${state.location!.longitude}';

                    //         lat = state.location!.latitude;
                    //         lng = state.location!.longitude;
                    //       }
                    //     }
                    //   },
                    //   builder: (context, state) {
                    //     return GestureDetector(
                    //       onTap: () {
                    //         BlocProvider.of<RegisterCubit>(context)
                    //             .pickTheLocation(context: context);
                    //       },
                    //       child: AppTextField(
                    //         lable: AppStrings.location,
                    //         hint: AppStrings.hintLocation,
                    //         controller: _controllerLocation,
                    //         icon: const Icon(Icons.location_on),
                    //       ),
                    //     );
                    //   },
                    // ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is OkResponseState) {
                          Navigator.pushNamed(context, ScreenNames.mainScreen);
                        } else if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("خطایی رخ داده")));
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return MainButton(
                              text: AppStrings.next,
                              onPressed: ()  async {
                                User user = User(
                                    name: _controllerNameLastName.text,
                                    phone: _controllerPhone.text,
                                    address: _controllerAddress.text,
                                    postalCode: _controllerPostalCode.text,
                                    image: await MultipartFile.fromFile(imageHandler.getImage!.path),
                                    lat: lat,
                                    lng: lng
                                    );

                                BlocProvider.of<RegisterCubit>(context)
                                    .register(user: user);
                              });
                        }
                      },
                    ),
                    AppDimens.large.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}