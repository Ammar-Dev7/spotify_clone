import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/song_entity.dart';
import '../../domain/repository/song_repository.dart';
import '../source/remote_data_source.dart';

class SongRepositoryImpl implements SongRepository {
  RemoteDataSource remoteDataSource;
  SongRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SongEntity>>> getSongs() async {
    try {
      final songs = await remoteDataSource.getSongs();
      return Right(songs);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}