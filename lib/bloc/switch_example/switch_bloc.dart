import 'package:counter_app/bloc/switch_example/switch_events.dart';
import 'package:counter_app/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderOpacity>(_sliderOpacity);
  }
  void _enableOrDisableNotification(
      EnableOrDisableNotification events, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderOpacity(SliderOpacity events, Emitter<SwitchState> emit) {
    emit(state.copyWith(mySlider: events.slider));
  }
}
