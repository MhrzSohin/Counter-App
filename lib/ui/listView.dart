import 'package:counter_app/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_events.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is list view"),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(child: Text("No data"));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<ToDoBloc>(context)
                              .add(DeleteTodoList(task: state.todoList[index]));
                        },
                        icon: const Icon(Icons.delete)),
                  );
                });
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 40; i++) {
            BlocProvider.of<ToDoBloc>(context)
                .add(AddTodoListEvent(task: "Task Management $i"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
