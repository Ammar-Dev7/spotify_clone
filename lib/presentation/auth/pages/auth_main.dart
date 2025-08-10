import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/widgets/back_btn.dart';
import 'package:spotify/core/widgets/custom_appbar.dart';
import 'package:spotify/core/widgets/reuseable_text.dart';
import 'package:spotify/core/widgets/text_style.dart';
import 'package:spotify/presentation/auth/pages/register_page.dart';
import 'package:spotify/presentation/auth/widgets/register_btn.dart';

import '../../../core/configs/assets/app_images.dart';
import 'login_page.dart';

class AuthMainPage extends StatelessWidget implements PreferredSizeWidget{
  const AuthMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 13.w),
            child: CustomAppbar(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(AppVectors.topPattern,fit: BoxFit.cover,)),
         Positioned(
             bottom: 0,
             left: 0,
             child: Image.asset(AppImages.authBG,fit: BoxFit.cover,)),
          Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(AppVectors.bottomPattern,fit: BoxFit.cover,)),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/6,),
                  SvgPicture.asset(AppVectors.logo),
                  SizedBox(height: 66.h,),
                  ReuseableText(text: "Enjoy listening to music",style: MyTextStyle(fontSize: 26, color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.w600),),
                  SizedBox(height: 24.h,),

                  Text(textAlign: TextAlign.center,
                    "Spotify is a proprietary Swedish audio streaming and media services provider",style: MyTextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w300),),
                  SizedBox(height: 24.h,),
                  Row(children: [
                    Expanded(child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                        child: RegisterBtn(text: "Register",))),
                    SizedBox(width: 20.w,),

                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width/2,
                            child: ReuseableText(
                          text: "Sign in",style: MyTextStyle(
                                fontSize: 20, color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.w500),)
                        ),
                      )
                    )
                  ],)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
