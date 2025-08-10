import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/auth/bloc/auth_event.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/reuseable_text.dart';
import '../../../core/widgets/text_style.dart';
import '../../../service_locator.dart';

import '../../Home/pages/home_screen.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/custom_text_fields.dart';
import '../widgets/register_btn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              title: SvgPicture.asset(AppVectors.logo, height: 34.h),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Text("Sign In", style: MyTextStyle(
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    )),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If you need any support?",
                            style: MyTextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: 13)),
                        Text(" Click here",
                            style: MyTextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 13)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: _emailController,
                      text: "Email",
                      obscureText: false,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: _passController,
                      text: "Password",
                      obscureText: true,
                    ),
                    SizedBox(height: 45.h),
                    GestureDetector(
                      onTap: () async{
                        final result = context.read<AuthBloc>().add(
                          LoginEvent(
                            email: _emailController.text,
                            password: _passController.text,
                            context: context
                          ),
                        );
                      },
                      child:
                      state.isLoading? const Center(
                        child: CircularProgressIndicator(),
                      ):
                      RegisterBtn(text: "Sign In"),
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(100),
                          ),
                        ),
                        Text(" Or ",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withAlpha(200))),
                        Expanded(
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableText(text: "Don't have an account?",
                        style: MyTextStyle(
                          color: Theme.of(context).colorScheme.tertiary.withAlpha(200),
                          fontSize: 11 ,fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle register navigation
                          },
                          child: ReuseableText(
                            text: " Register",
                            style: MyTextStyle(
                                color: Colors.blue,
                                fontSize: 12 ,fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
