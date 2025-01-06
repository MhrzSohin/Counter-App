import 'package:counter_app/model/movie_model/movie_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<Result>? movieResponse;
  final List<Result>? tempMoviesList;
  final PostStatus postStatus;
  final String? message;
  MoviesState(
      {this.movieResponse,
      this.tempMoviesList,
      this.message,
      this.postStatus = PostStatus.loading});
  MoviesState copyWith(
      {List<Result>? movieResponse,
      List<Result>? tempMoviesList,
      PostStatus? postStatus,
      String? message}) {
    return MoviesState(
        movieResponse: movieResponse ?? this.movieResponse,
        tempMoviesList: tempMoviesList ?? this.tempMoviesList,
        message: message ?? this.message,
        postStatus: postStatus ?? this.postStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [movieResponse, postStatus, message, tempMoviesList];
}
