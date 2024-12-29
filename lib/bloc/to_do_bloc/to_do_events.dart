import 'package:equatable/equatable.dart';

abstract class ToDoEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddTodoListEvent extends ToDoEvents {
  final String task;
  AddTodoListEvent({required this.task});
}

class DeleteTodoList extends ToDoEvents {
  final Object task;
  DeleteTodoList({required this.task});
}
