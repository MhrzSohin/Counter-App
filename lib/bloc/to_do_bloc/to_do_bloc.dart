import 'package:counter_app/bloc/to_do_bloc/to_do_events.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvents, ToDoState> {
  final List<String> todoListState = [];
  ToDoBloc() : super(ToDoState()) {
    on<AddTodoListEvent>(_AddTodoListEvent);
    on<DeleteTodoList>(_DeleteTodoList);
  }
  void _AddTodoListEvent(AddTodoListEvent events, Emitter<ToDoState> emit) {
    todoListState.add(events.task);
    emit(state.copyWith(todolist: List.from(todoListState)));
  }

  void _DeleteTodoList(DeleteTodoList events, Emitter<ToDoState> emit) {
    todoListState.remove(events.task);
    emit(state.copyWith(todolist: List.from(todoListState)));
  }
}
