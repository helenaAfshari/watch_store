import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/data/repository/home_repo.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screen/mainscreen/multi_landscapeMainScreens/homescreen/bloc/home_bloc.dart';
import 'package:watch_store_app/screen/multilandscapescreens/productlist_multilandscape/product_list_screen.dart';
import 'package:watch_store_app/widgets/app_slider.dart';
import 'package:watch_store_app/widgets/category_widget.dart';
import 'package:watch_store_app/widgets/product_item.dart';
import 'package:watch_store_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit());
        return homeBloc;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoaded) {
                  return Column(
                    children: [
                    SearchBarBtn(
                      onTap: () {},
                    ),
                    AppSlider(imgList:state.home.sliders),
                   SizedBox(
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.home.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          title: state.home.categories[index].title, 
                          onTap: (){
                            state.home.categories[index].id;
                            // print("Id is : ${state.home.categories[index].id}");
                            //to product list screen
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(
                           param:   state.home.categories[index].id
                            ),));
                          }, 
                          colors:index.isEven? AppColors.catDesktopColors:AppColors.catDigitalColors, 
                          iconPath: state.home.categories[index].image);
                      },),
                   ),
                    AppDimens.large.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.amazingProducts.length,
                              shrinkWrap: true,
                              reverse: true,
                              itemBuilder: (context, index) => ProductItem(
                                specialExpiration: state.home.amazingProducts[index].specialExpiration,
                                productName: state.home.amazingProducts[index].title,
                                price: state.home.amazingProducts[index].price,
                                discount: state.home.amazingProducts[index].discount,
                              ),
                            ),
                          ),
                          VerticalText()
                        ],
                      ),
                    )
                  ]);
                } else if (state is HomeError) {
                  return Text("Error");
                } else {
                  throw Exception('invalid state');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                    angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
                AppDimens.medium.width,
                Text(AppStrings.viewAll),
              ],
            ),
            Text(
              "شگفت انگیز",
              style: AppTextStyles.amazingStyle,
            ),
          ],
        ),
      ),
    );
  }
}
