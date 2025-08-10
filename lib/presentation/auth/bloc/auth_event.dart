
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/user_entity.dart';

 class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];

 }

 class RegisterEvent extends AuthEvent {
   final String name;
   final String email;
  final String password;
  final BuildContext context;
  const RegisterEvent({required this.name, required this.email, required this.password, required this.context});
  @override
  List<Object?> get props => [name,email,password,context];
 }
class LoginEvent extends AuthEvent {
   final BuildContext context;
  final String email;
  final String password;
  const LoginEvent({ required this.context,required this.email, required this.password});
  @override
  List<Object?> get props => [email,password,context];
}