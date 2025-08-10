 import 'package:dartz/dartz.dart';
import 'package:spotify/core/errors/failure.dart';

abstract class UseCase <SuccessType,Params>{

  Future<Either<Failure,SuccessType>> call(Params params);
}
class NoParams{}