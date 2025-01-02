import 'package:counter_app/bloc/post_api_bloc/api_events.dart';
import 'package:counter_app/bloc/post_api_bloc/api_state.dart';
import 'package:counter_app/model/post_model.dart';
import 'package:counter_app/repository/post_repository.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvents, ApiState> {
  List<PostModel> tempPostList = [];
  PostRepository postRepository = PostRepository();
  ApiBloc() : super(const ApiState()) {
    on<PostFetchedEvent>(_postFetchedEvent);
    on<APIDataFilterEvent>(_apiDataFilterEvent);
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

  void _apiDataFilterEvent(APIDataFilterEvent events, Emitter<ApiState> emit) {
    if (events.searchText.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ""));
    } else {
      tempPostList = state.postlist
          .where((element) =>
              element.id.toString() == events.searchText.toString())
          .toList();
      if (tempPostList.isEmpty) {
        emit(state.copyWith(
            tempPostList: tempPostList, searchMessage: "No Data Found"));
      } else {
        emit(state.copyWith(tempPostList: tempPostList));
      }
    }
  }
}
