import 'package:counter_app/bloc/user_data_fetching/user_data_events.dart';
import 'package:counter_app/bloc/user_data_fetching/user_data_state.dart';
import 'package:counter_app/repository/user_data_repository.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataBloc extends Bloc<UserDataEvents, UserDataState> {
  UserDataRepository userDataRepository = UserDataRepository();
  UserDataBloc() : super(UserDataState()) {
    on<UserDataFetchingEvent>(_userDataFetchingEvent);
   
  }
  void _userDataFetchingEvent(
      UserDataFetchingEvent events, Emitter<UserDataState> emit) async {
    await userDataRepository.fetchUserData().then((value) {
      emit(state.copyWith(
          userList: value,
          message: "Data Fetched Successfully",
          postStatus: PostStatus.success));
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
            message: error.toString(), postStatus: PostStatus.failure));
      },
    );
  }

}
