part of 'choose_mode_bloc.dart';

  class ChooseModeState extends Equatable {
  final ThemeMode themeMode;
   ChooseModeState({required this.themeMode});
   ChooseModeState copyWith({
    ThemeMode? themeMode,
  }) {
     return ChooseModeState(
       themeMode: themeMode ?? this.themeMode,
     );
   }

  @override
  List<Object?> get props => [themeMode];
}
