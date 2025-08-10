import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/song_entity.dart';

abstract class SongRepository{
  Future<Either<Failure,List<SongEntity>>> getSongs();
}