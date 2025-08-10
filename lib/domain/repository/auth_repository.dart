import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register( String  username, String email, String password);
  Future<Either<Failure, UserEntity>> login( String email, String password);

}