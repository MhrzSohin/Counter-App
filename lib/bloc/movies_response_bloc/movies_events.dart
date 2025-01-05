import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MoviesFetchingEvents extends MoviesEvents {}

class MoviesSearchEvents extends MoviesEvents {
  final String SearchText;
  MoviesSearchEvents(this.SearchText);
}
