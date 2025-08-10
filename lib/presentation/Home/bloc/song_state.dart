
import 'package:equatable/equatable.dart';

import '../../../domain/entities/song_entity.dart';

 class SongState extends Equatable {
  final  bool isLoading;
  final List<SongEntity> songs;

  const SongState({this.isLoading=false,required this.songs});
  @override
  List<Object> get props => [isLoading];

  SongState copyWith({
    bool? isLoading,
    List<SongEntity>? songs,
  }){
    return SongState(
      isLoading: isLoading ?? this.isLoading,
      songs: songs ?? this.songs,
    );
  }






}
