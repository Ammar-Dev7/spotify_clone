  import 'package:spotify/domain/entities/song_entity.dart';

class SongModel extends SongEntity{
  SongModel({required super.title,
    required super.artist,
    required super.audioUrl,
    required super.coverUrl,
    required super.date,
    required super.duration});
  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'],
      artist: json['artist'],
      audioUrl: json['audioUrl'],
      coverUrl: json['coverUrl'],
      date: json['date'],
      duration: json['duration'],
    );
  }

}