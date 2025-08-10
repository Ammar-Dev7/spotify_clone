import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/core/errors/failure.dart';
import 'package:spotify/domain/usecases/get_song_usecase.dart';
import 'package:spotify/presentation/Home/bloc/song_event.dart';
import 'package:spotify/presentation/Home/bloc/song_state.dart';

import '../../../core/usecase/usecase.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  GetSongUseCase getSongUseCase;
  SongBloc({required this.getSongUseCase}) : super(SongState(songs: [])) {
    on<GettingSongsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
        var result = await getSongUseCase.call(NoParams());
        result.fold((error){
          return ServerFailure(error.message);},
            (songsList)=>emit(state.copyWith(isLoading: false, songs: songsList))
      );
    });
  }
}
