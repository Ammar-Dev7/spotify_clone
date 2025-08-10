import 'package:dartz/dartz.dart';
import 'package:spotify/core/errors/failure.dart';
import 'package:spotify/data/source/remote_data_source.dart';
import 'package:spotify/domain/entities/user_entity.dart';
import 'package:spotify/domain/repository/auth_repository.dart';

import '../models/UserModel.dart';

class AuthReoositoryImpl extends AuthRepository{
  RemoteDataSource remoteDataSource;
  AuthReoositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(String name, String email, String password) async {
    print("called3");
    try {
      final registeredUser = await remoteDataSource.register(
        name,email,
        password,
      );
      return Right(registeredUser); // registeredUser is already a UserEntity
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password)async {
    try{
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    }
        catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}