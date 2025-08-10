import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/widgets/reuseable_text.dart';
import 'package:spotify/presentation/choose_mode/page/choose_mode_page.dart';
import 'package:spotify/presentation/splash/widgets/main_btn.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../core/widgets/text_style.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.introBG),
              fit: BoxFit.cover,
            ),
          ),
        ),
     Container(
       margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
       child: Column(
         children: [
           SizedBox(height:30.h,),
           SvgPicture.asset(AppVectors.logo),
           Spacer(),
           ReuseableText(
             text: "Enjoy listening to music",
             style: MyTextStyle(
                 fontSize: 26, color: AppColors.lightLowWhiteMainText, fontWeight: FontWeight.w600),
           ),
           SizedBox(height: 28.h,),

           Text("Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",textAlign: TextAlign.center,
           style: MyTextStyle(fontSize: 16, color: AppColors.lightLowWhiteSecondaryText, fontWeight: FontWeight.normal),
           ),
           SizedBox(height: 28.h,),

           MainBtn(text: "Get Started",onPressed: (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChooseModePage()));
           },),
           SizedBox(height: 36.h,),

         ],
       ),
     ),
      ],
    );
  }
}
