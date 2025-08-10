import 'package:dartz/dartz.dart';
import 'package:spotify/core/errors/failure.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/entities/user_entity.dart';
import 'package:spotify/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<UserEntity,LoginParams>{

  final AuthRepository repository;
  LoginUseCase({required this.repository});


  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return repository.login(params.email, params.password);
  }}

  class LoginParams{
  final String email;
  final String password;
  LoginParams(this.email,this.password);
  }


