import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
class SongEntity extends Equatable{
  final String title;
  final String artist;
  final String audioUrl;
  final String coverUrl;
  final String date;     // or DateTime if you want to convert
  final String duration;
  SongEntity({
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.coverUrl,
    required this.date,
    required this.duration,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [title,artist,audioUrl,coverUrl,date,duration];

}