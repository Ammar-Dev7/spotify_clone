import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';


class TabList extends StatelessWidget {
  const TabList({super.key,required this.controller});
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.only(top: 35.h,bottom: 20.h),
        controller:controller,
        indicatorColor: AppColors.primary,
        labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 16.w),
        labelColor: Theme.of(context).colorScheme.onPrimary,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.sp),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22.sp,
        ),
        unselectedLabelColor: Theme.of(context).colorScheme.onPrimary.withAlpha(80),
        tabs: [
      Text("News"),
      Text("Video"),
      Text("Artists"),
      Text("Podcast"),
    ]);
  }
}
