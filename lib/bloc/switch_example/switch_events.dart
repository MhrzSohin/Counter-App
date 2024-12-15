import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class EnableOrDisableNotification extends SwitchEvents {}

class SliderOpacity extends SwitchEvents {
  double slider;
  SliderOpacity({required this.slider});
  @override
  // TODO: implement props
  List<Object?> get props => [slider];
}
