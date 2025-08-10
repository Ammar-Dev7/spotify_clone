import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/auth/pages/auth_main.dart';
import 'package:spotify/presentation/choose_mode/bloc/choose_mode_bloc.dart';
import 'package:spotify/presentation/choose_mode/widgets/mode%20oval.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../core/widgets/reuseable_text.dart';
import '../../../core/widgets/text_style.dart';
import '../../splash/widgets/main_btn.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseModeBloc, ChooseModeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.chooseModeBG),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    SvgPicture.asset(AppVectors.logo),
                    Spacer(),
                    ReuseableText(
                      text: "Choose Mode",
                      style: MyTextStyle(
                        fontSize: 26,
                        color: AppColors.lightLowWhiteMainText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ChooseModeBloc>().add(
                                  DarkModeEvent(),
                                );
                              },
                              child: ModeOval(imagePath: AppVectors.moon),
                            ),
                            SizedBox(height: 10.h),
                            ReuseableText(
                              text: "Dark Mode",
                              style: TextStyle(
                                color: AppColors.lightLowWhiteMainText,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ChooseModeBloc>().add(
                                  LightModeEvent(),
                                );
                              },
                              child: ModeOval(imagePath: AppVectors.sun),
                            ),
                            SizedBox(height: 10.h),
                            ReuseableText(
                              text: "Light Mode",
                              style: TextStyle(
                                color: AppColors.lightLowWhiteMainText,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 62.h),
                    MainBtn(
                      text: "Continue",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthMainPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
