import 'package:equatable/equatable.dart';

abstract class UserDataEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataFetchingEvent extends UserDataEvents {}

