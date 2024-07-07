//2:2
String formatTime(int sec){
  String resultFormat;
  // int min = sec ~/60;
  // int seconds = sec % 60;
  // //دوتا کاراکتر بیاد سمت چپ
  // String minStr = min.toString().padLeft(2,"0");
  // String secondsStr = seconds.toString().padLeft(2,"0");
  // return '$minStr:$secondsStr';
  final duration = Duration(seconds: sec);
  int h = duration.inHours;
  int m = duration.inMinutes.remainder(60);
  int s = duration.inSeconds.remainder(60);
  //3600 یک ساعت
  if (sec>3600) {
    resultFormat = "$h:$m:$s";
  } else {
        resultFormat = "$m:$s";

  }
   return resultFormat;
}