abstract class PlayEvent {}

class PlaySong extends PlayEvent {
  final String url;
  PlaySong(this.url);
}

class PauseSong extends PlayEvent {}

class ResumeSong extends PlayEvent {}

class UpdatePosition extends PlayEvent {
  final Duration position;
  final Duration duration;
  UpdatePosition(this.position, this.duration);
}
