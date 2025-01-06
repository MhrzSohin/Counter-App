import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/movies_response_bloc/movies_events.dart';
import 'package:counter_app/bloc/movies_response_bloc/movies_state.dart';
import 'package:counter_app/model/movie_model/movie_model.dart';
import 'package:counter_app/repository/movie_repository.dart';
import 'package:counter_app/utils/enums.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  List<Result>? tempMoviesResponse = <Result>[];
  MovieRepository movieRepository = MovieRepository();
  MoviesBloc() : super(MoviesState()) {
    on<MoviesFetchingEvents>(_moviesFetchingEvents);
    on<MoviesSearchEvents>(_moviesSearchEvents);
  }
  void _moviesFetchingEvents(
      MoviesFetchingEvents events, Emitter<MoviesState> emit) async {
    await movieRepository.fetchDataFromAPI().then((value) {
      emit(state.copyWith(
        movieResponse: value,
        message: "Data Fetched Successfully",
        postStatus: PostStatus.success,
      ));
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
            message: "error while fetching data",
            postStatus: PostStatus.failure));
      },
    );
  }

  void _moviesSearchEvents(
      MoviesSearchEvents events, Emitter<MoviesState> emit) {
    tempMoviesResponse = state.movieResponse
        ?.where((element) => element.title
            .toString()
            .toLowerCase()
            .contains(events.SearchText.toLowerCase()))
        .toList();
    emit(state.copyWith(tempMoviesList: tempMoviesResponse));
  }
}
