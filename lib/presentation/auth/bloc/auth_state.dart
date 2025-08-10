
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';

 class AuthState extends Equatable {
  final bool isLoading;
  const AuthState({this.isLoading = false,});



  AuthState copyWith({
    bool? isLoading,
    bool? initialLogin,
  }){
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [ isLoading];
}

