class PlayState {
  final bool isPlaying;
  final Duration position;
  final Duration duration;

  PlayState({
    this.isPlaying = true,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  PlayState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
  }) {
    return PlayState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}
