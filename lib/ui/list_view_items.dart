import 'package:counter_app/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_events.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_state.dart';
import 'package:counter_app/ui/task_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
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
                    iconColor: Colors.red,
                    title: Text(
                      state.todoList[index],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
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
          // for (int i = 0; i < 40; i++) {
          //   BlocProvider.of<ToDoBloc>(context)
          //       .add(AddTodoListEvent(task: "Task Management $i"));
          // }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TaskAdd()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
