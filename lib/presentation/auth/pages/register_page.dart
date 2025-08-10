import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/data/models/UserModel.dart';
import 'package:spotify/presentation/auth/bloc/auth_bloc.dart';
import 'package:spotify/presentation/auth/bloc/auth_event.dart';
import 'package:spotify/presentation/auth/bloc/auth_state.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/reuseable_text.dart';
import '../../../core/widgets/text_style.dart';
import '../../../service_locator.dart';

import '../widgets/custom_text_fields.dart';
import '../widgets/register_btn.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController _nameController = TextEditingController();
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
                    Text("Register",
                        style: MyTextStyle(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600)),
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
                      controller: _nameController,
                      text: "Full Name",
                      obscureText: false,
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
                        context.read<AuthBloc>().add(RegisterEvent(
                          context: context,
                          name: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passController.text.trim()));
                        print(_passController.text);
                      },
                      child:
                      state.isLoading?
                      const CircularProgressIndicator():
                      RegisterBtn(text: "Create Account"),
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
                        ReuseableText(text: "Already have an account?"),
                        GestureDetector(
                          onTap: () {
                          },
                          child: ReuseableText(
                            text: " Sign In",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
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