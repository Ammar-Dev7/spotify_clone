import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.text, required this.controller, required this.obscureText});
  final text;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(obscureText: obscureText,
      controller: controller,
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(130)
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(28.h),
        hintText: text,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(130)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.r),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary.withAlpha(50)
            )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(50)
          )
        )
      )
    );
  }
}
