import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../configs/theme/app_colors.dart';
TextStyle MyTextStyle(
    {
      required double fontSize,
      required Color color,
      required FontWeight fontWeight,
    }
    ){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      decoration: TextDecoration.none,
    ),
  );
}