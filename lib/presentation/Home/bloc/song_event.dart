
import 'package:equatable/equatable.dart';

sealed class SongEvent extends Equatable {
  const SongEvent();
}
class GettingSongsEvent extends  SongEvent {

  const GettingSongsEvent();
  @override
  List<Object> get props => [];
}
