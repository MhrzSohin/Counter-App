
import 'package:counter_app/model/user_data_model/user_data_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class UserDataState extends Equatable {
  final PostStatus postStatus;
  final String message;
  final List<UserDataModel> userList;
  UserDataState(
      {this.postStatus = PostStatus.loading,
      this.userList = const <UserDataModel>[],
      this.message = ' '});

  UserDataState copyWith(
      {PostStatus? postStatus,
      String? message,
      List<UserDataModel>? userList}) {
    return UserDataState(
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message,
        userList: userList ?? this.userList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, message, userList];
}
