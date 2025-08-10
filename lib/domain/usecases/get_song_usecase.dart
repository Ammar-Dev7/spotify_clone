import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/song_entity.dart';
import '../repository/song_repository.dart';

class GetSongUseCase implements UseCase<List<SongEntity>, NoParams>{
  final SongRepository songRepository;
  GetSongUseCase({required this.songRepository});
  @override
 Future<Either<Failure, List<SongEntity>>> call(NoParams params) async{
    return songRepository.getSongs();
  }
}