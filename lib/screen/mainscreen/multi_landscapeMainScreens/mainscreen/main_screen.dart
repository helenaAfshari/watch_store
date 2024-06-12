
import 'package:flutter/material.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/basketScreen/basket_screen_multi_land_scape.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/basketscreen/basket_screen.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/homescreen/home_screen_multy_land_scape.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/profileScreen/profile_screen_multy_land_scape.dart';
import 'package:watch_store_app/widgets/btm_nav_item.dart';
import 'package:watch_store_app/widgets/cart_badge.dart';


class BtmNavScreenIdex{
  BtmNavScreenIdex._();
  static const home = 0;
  static const basket = 1;
  static const profile = 2;
}
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<int>_routeHistory = [BtmNavScreenIdex.home];
  int selectedIndex = BtmNavScreenIdex.home;
  //اینجا از نوع نویگیتور استیت هست که که میخواییم حالات نویگیتور استیت باشه
  //چون هوم کی شد به علت این که اولین روت تو  هوم میره 
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  late final map = {
   BtmNavScreenIdex.home:_homeKey,
   BtmNavScreenIdex.basket:_basketKey,
   BtmNavScreenIdex.profile:_profileKey,

  };

  Future<bool>_onWillPop() async{
    if(map[selectedIndex]!.currentState!.canPop()){
      map[selectedIndex]!.currentState!.pop();
    }else if(_routeHistory.length>1){
      setState(() {
        //این لست اخری را حذف میکنه یکی از گزینه های پرکاربرد لیست هست 
        _routeHistory.removeLast();
        selectedIndex = _routeHistory.last;
      });
    }
    
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double btmNavHeight = size.height*.1;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
          children: [
               Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: btmNavHeight,
            child: IndexedStack(
              index: selectedIndex,
            children: [
           Navigator(
            key: _homeKey,
            onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const MultyLandScapeHomeScreen(),),),
           Navigator(
            key: _basketKey,
            onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const MultyLandScapeBasketScreen(),),),
           Navigator(
            key: _profileKey,
            onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const MultyLandScapeProfileScreen(),),),
            ],),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
            child: Container(
              color: AppColors.btmNavColor,
              height: btmNavHeight,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BtmNavItem(
                iconSvgPath: Assets.svg.user, 
                text: AppStrings.profile, 
                isActive: selectedIndex == BtmNavScreenIdex.profile,  
                 onTap:()=> btmNavOnPressed(index: BtmNavScreenIdex.profile),
               ),
              
                  BtmNavItem(
                  count: 2,
                  iconSvgPath: Assets.svg.cart, 
                  text: AppStrings.basket, 
                  isActive: selectedIndex == BtmNavScreenIdex.basket, 
                  onTap:()=> btmNavOnPressed(index: BtmNavScreenIdex.basket),
                  ),
                BtmNavItem(
                iconSvgPath: Assets.svg.home, 
                text: AppStrings.home, 
                isActive: selectedIndex == BtmNavScreenIdex.home, 
                onTap: () => btmNavOnPressed(index: BtmNavScreenIdex.home),),
              ]),
            )),
          ],)
        ),
      ),
    );
  }

  btmNavOnPressed({required index}){
   setState(() {
     selectedIndex = index;
     _routeHistory.add(selectedIndex);
   });
  }
}
