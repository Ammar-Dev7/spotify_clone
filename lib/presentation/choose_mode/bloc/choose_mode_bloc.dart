import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'choose_mode_event.dart';
part 'choose_mode_state.dart';

class ChooseModeBloc extends Bloc<ChooseModeEvent, ChooseModeState> {
  ChooseModeBloc() : super(ChooseModeState(themeMode: ThemeMode.system)) {
    on<DarkModeEvent>(_darkModeEvent);
    on<LightModeEvent>(_lightModeEvent);
  }
  void _darkModeEvent(DarkModeEvent event,Emitter emit){
      emit(state.copyWith(themeMode: ThemeMode.dark));
  }
  void _lightModeEvent(LightModeEvent event,Emitter emit){
    emit(state.copyWith(themeMode: ThemeMode.light));
  }
}
