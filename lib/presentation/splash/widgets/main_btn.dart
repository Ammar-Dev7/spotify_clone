import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/widgets/reuseable_text.dart';
import 'package:spotify/core/widgets/text_style.dart';
import '../../../core/configs/theme/app_colors.dart';

class MainBtn extends StatelessWidget {
   MainBtn({super.key,required this.text,required this.onPressed});
   String text;
   VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().screenWidth,
        height: 90.sp,
        child: Text(text,style: MyTextStyle(fontSize: 26,color: Colors.white, fontWeight: FontWeight.w600),),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
