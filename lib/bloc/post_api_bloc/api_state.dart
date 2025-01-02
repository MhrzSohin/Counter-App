import 'package:counter_app/model/post_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postlist;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const ApiState(
      {this.postStatus = PostStatus.loading,
      this.message = ' ',
      this.searchMessage = ' ',
      this.postlist = const <PostModel>[],
      this.tempPostList = const <PostModel>[]});

  ApiState copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postlist,
      String? message,
      String? searchMessage,
      List<PostModel>? tempPostList}) {
    return ApiState(
        postStatus: postStatus ?? this.postStatus,
        postlist: postlist ?? this.postlist,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage,
        tempPostList: tempPostList ?? this.tempPostList);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postStatus, postlist, message, tempPostList, searchMessage];
}
