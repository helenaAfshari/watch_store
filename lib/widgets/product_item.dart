

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_app/component/extention.dart';
import 'package:watch_store_app/component/text_style.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/utils/format_time.dart';

class ProductItem extends StatefulWidget {
   ProductItem({
    super.key,
    required this.productName,
    required this.price,
    this.discount = 0,
    //این همون تایم هست
    this.specialExpiration = "",
    this.oldPrice=0,
  });
   final productName;
   final int price;
   final int oldPrice;
   final discount;
   final specialExpiration;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {


Duration _duration = Duration(seconds: 0);
late Timer _timer;
 int insecond = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(_duration, () { });
    if(widget.specialExpiration!=""){
 DateTime now = DateTime.now();
    DateTime expiration = DateTime.parse(widget.specialExpiration);
    //این میاد مثلا 4 تیر تا 10تیر میاد حساب میکنه که چقدر زمان دارم
    _duration = now.difference(expiration).abs();
     insecond = _duration.inSeconds;
     startTimer();
    }
   


  //   //حالا میاییم ساعت و دقیقه رو میگیریم
  //  int hourse = _duration.inHours;
  //  //این reminder
  //  //در واقع باقی مانده تقسیم یه عدد به یه عدد دیگرو حساب میکنه 
  //  //60 دقیقه هامون در میاد 
  //  int minutes = _duration.inMinutes.remainder(60);
  //  //اینم چند ثانیه هست 
  //  int seconds = _duration.inSeconds.remainder(60);

  //  print("$hourse:$minutes:$seconds");

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        gradient:const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:  AppColors.productBgGradiant),
      ),
      //color: Colors.black,
      width: 200,
      child:Column(
        children: [
        Image.asset(Assets.png.unnamed.path),
        Align(
          alignment: Alignment.centerRight,
          child: Text(widget.productName,style: AppTextStyles.productTitle,)),
          AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.price.separateWithComma}تومان",style: AppTextStyles.title,),
                  Visibility(
                    visible: widget.discount>0 ? true:false,
                    child: Text(widget.oldPrice.separateWithComma,style: AppTextStyles.oldPriceStyle,)),
                ],
              ),
              Visibility(
                visible: _duration.inSeconds>0?true:false,
                child: Container(
                  padding: EdgeInsets.all(AppDimens.small*.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.red,
                  
                  ),
                  child: Text("${widget.discount}%"),
                ),
              )
            ],
          ),
          AppDimens.medium.height,
          Visibility(
            visible: _duration.inSeconds>0 ? true:false,
            child: Container(height: 2,width: double.infinity,color: Colors.blue,)),
          AppDimens.medium.height,

          Visibility(
            visible: widget.specialExpiration>0?true:false,
            child: Text(
              formatTime(insecond),
            style: AppTextStyles.prodTimerStyle,)),
      ]) ,
    );
  }
  
void startTimer(){
   const oneSec = Duration(seconds: 1);
   _timer = Timer.periodic(oneSec, (timer) { 
    setState(() {
      if(insecond == 0){
      
        print("product onTab limitted");
      }else{
        //اگر 0نشده بود بیا دونه دونه از این second کم کن
        insecond--;
      }
    });
   });
}
}
