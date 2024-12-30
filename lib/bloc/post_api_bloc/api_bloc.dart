import 'package:counter_app/bloc/post_api_bloc/api_events.dart';
import 'package:counter_app/bloc/post_api_bloc/api_state.dart';
import 'package:counter_app/repository/post_repository.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvents, ApiState> {
  PostRepository postRepository = PostRepository();
  ApiBloc() : super(const ApiState()) {
    on<PostFetchedEvent>(_postFetchedEvent);
  }
  void _postFetchedEvent(
      PostFetchedEvent events, Emitter<ApiState> emit) async {
   await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postlist: value,
          message: "Data Fetched Successfully",
          postStatus: PostStatus.success));
    }).onError(
      (error, stackTrace) {
        print(stackTrace);
        print(error);
        emit(state.copyWith(
            message: error.toString(), postStatus: PostStatus.failure));
      },
    );
  }
}
