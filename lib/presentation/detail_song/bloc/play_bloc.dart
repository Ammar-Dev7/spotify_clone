import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'play_event.dart';
import 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  final AudioPlayer audioPlayer;

  PlayBloc({required this.audioPlayer}) : super(PlayState()) {
    // Handle events
    on<PlaySong>(_onPlaySong);
    on<PauseSong>(_onPauseSong);
    on<ResumeSong>(_onResumeSong);
    on<UpdatePosition>(_onUpdatePosition);

    // Listen to player position changes
    audioPlayer.positionStream.listen((pos) {
      add(UpdatePosition(pos, audioPlayer.duration ?? Duration.zero));
    });
  }

  Future<void> _onPlaySong(PlaySong event, Emitter<PlayState> emit) async {
    try {
      await audioPlayer.setUrl(event.url);
      await audioPlayer.play();
      emit(state.copyWith(
        isPlaying: true,
        duration: audioPlayer.duration ?? Duration.zero,
        position: Duration.zero,
      ));
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  Future<void> _onPauseSong(PauseSong event, Emitter<PlayState> emit) async {
    await audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> _onResumeSong(ResumeSong event, Emitter<PlayState> emit) async {
    await audioPlayer.play();
    emit(state.copyWith(isPlaying: true));
  }

  void _onUpdatePosition(UpdatePosition event, Emitter<PlayState> emit) {
    emit(state.copyWith(
      position: event.position,
      duration: event.duration,
    ));
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
