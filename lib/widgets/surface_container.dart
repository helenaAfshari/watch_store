
import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({
    super.key,
    required this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.sizeOf(context);

    return Container(
      margin: EdgeInsets.fromLTRB(AppDimens.medium, AppDimens.medium, AppDimens.medium, 0),
     padding: EdgeInsets.all(AppDimens.medium),
    width: double.infinity,
    
    decoration: BoxDecoration(
      color: AppColors.surfaceColor,
      borderRadius: BorderRadius.circular(AppDimens.medium),
    ),
    child: child,
    );
  }
}