import 'package:counter_app/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskAddController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: taskAddController,
              decoration: InputDecoration(
                  hintText: "Enter Your Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ToDoBloc>(context).add(
                    AddTodoListEvent(task: taskAddController.text.toString()));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: const Text("Add a Task"),
            )
          ],
        ),
      ),
    );
  }
}
