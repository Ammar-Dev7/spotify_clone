import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_vectors.dart';
class ModeOval extends StatelessWidget {
   ModeOval({super.key, required this.imagePath});
   String imagePath;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: Container(height: 50.h, width: 50.w,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(imagePath),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),),
      ),
    );
  }
}
