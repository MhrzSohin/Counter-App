import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  double mySlider;

  SwitchState({this.isSwitch = false,
  this.mySlider = 0.4});
  SwitchState copyWith({bool? isSwitch, double? mySlider}) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      mySlider: mySlider ?? this.mySlider);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, mySlider];
}
