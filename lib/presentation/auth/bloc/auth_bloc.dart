
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/domain/usecases/register_usecases.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../service_locator.dart';
import '../../Home/pages/home_screen.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  AuthBloc({required this.registerUseCase,
  required this.loginUseCase
  }) : super(AuthState()) {
    on<RegisterEvent>((RegisterEvent event, emit) async{

      emit(state.copyWith(isLoading: true));
      final result=await registerUseCase.call(RegisterParams(
        email: event.email,
          password: event.password, fullName:  event.name));
      result.fold(
          (failure){
            var snackBar=SnackBar(content: Text(failure.message));
            ScaffoldMessenger.of(event.context).showSnackBar(snackBar);
            return emit(state.copyWith(
              isLoading: false,
            ));
          },

          (success){
            var snackBar=SnackBar(content: Text("User Registered"));
            ScaffoldMessenger.of(event.context).showSnackBar(snackBar);
            return emit(state.copyWith(
              isLoading: false,
            ));
            return emit(state.copyWith(
              isLoading: false,
            ));
          });
    });
    on<LoginEvent>((event, emit) async{
      emit(state.copyWith(isLoading: true));
      final result=await loginUseCase.call(LoginParams(event.email, event.password));
      result.fold((failure){
        var snackBar=SnackBar(content: Text(failure.message));
        ScaffoldMessenger.of(event.context).showSnackBar(snackBar);
        return emit(state.copyWith(
          isLoading: false,
        ));
      }, (success){
        Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(
                builder: (context) => Home()));
        return emit(state.copyWith(
          isLoading: false,
        ),
        );
      });
    });
  }
}
