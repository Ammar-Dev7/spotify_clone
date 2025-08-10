import 'package:dartz/dartz.dart';
import 'package:spotify/core/errors/failure.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/entities/user_entity.dart';
import 'package:spotify/domain/repository/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity,RegisterParams>{
   final AuthRepository repository;
  RegisterUseCase({required this.repository});
  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) {

    return repository.register(params.fullName, params.email, params.password);
  }

}

class RegisterParams {
  final String email;
  final String fullName;
  final String password;
  RegisterParams({required this.password ,required this.fullName,required this.email});
}