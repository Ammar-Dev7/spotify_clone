import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/widgets/reuseable_text.dart';
import 'package:spotify/core/widgets/text_style.dart';
class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key,required this.text});
final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ReuseableText(text: text,style: MyTextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
      height: 76.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
