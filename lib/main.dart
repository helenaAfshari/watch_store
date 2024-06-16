import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_store_app/component/themes.dart';
import 'package:watch_store_app/route/names.dart';
import 'package:watch_store_app/route/routes.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/mainscreen/main_screen_multy_land_scape.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/send_sms_multilandscape/multi_landscape_send_sms.dart';
import 'package:watch_store_app/screen/multilandscapescreens/auth/send_sms_multilandscape/send_sms_screen.dart';
import 'package:watch_store_app/utils/shared_prefrences_managment.dart';

void main()async {
  //اینجا اطمینان حاصل میکند که اینیشیال شده 
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefrencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        title: 'Flutter Demo',
        // home: MultiLandScapeCartScreen(),
        // initialRoute: ScreenNames.root,
        routes: routes,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {

            if (state is LoggedInState) {
             return MultyLandScapeMainScreen();

            } else if(state is LoggedOutState){
             return MultiLandScapeSendSmsScreen();
            }else{
          return MultiLandScapeSendSmsScreen();

            }
          },
        ),
      ),
    );
  }
}
