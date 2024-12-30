import 'package:counter_app/model/post_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postlist;
  final String message;

  const ApiState(
      {this.postStatus = PostStatus.loading,
      this.message = ' ',
      this.postlist = const <PostModel>[]});

  ApiState copyWith(
      {PostStatus? postStatus, List<PostModel>? postlist, String? message}) {
    return ApiState(
        postStatus: postStatus ?? this.postStatus,
        postlist: postlist ?? this.postlist,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postlist, message];
}
