import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/theme/app_colors.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 4.w,),
          GestureDetector(
            onTap: (){

              Navigator.pop(context);
            },
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.arrow_back_ios_new_outlined,size: 16.sp,color: Theme.of(context).colorScheme.tertiary,),
            ),
          ),
        ],
      ),
    );
  }
}
