part of 'choose_mode_bloc.dart';

sealed class ChooseModeEvent extends Equatable {
  const ChooseModeEvent();
}

class DarkModeEvent extends ChooseModeEvent{
  @override
  List<Object?> get props => [];
}
class LightModeEvent extends ChooseModeEvent{
  @override
  List<Object?> get props => [];
}