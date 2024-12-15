import 'package:counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_bloc/counter_state.dart';
import 'package:counter_app/bloc/switch_example/switch_bloc.dart';
import 'package:counter_app/bloc/switch_example/switch_events.dart';
import 'package:counter_app/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Application"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Notifications",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      BlocBuilder<SwitchBloc, SwitchState>(
                        buildWhen: (previous, current) =>
                            previous.isSwitch != current.isSwitch,
                        builder: (context, state) {
                          print("notifications");
                          return Switch(
                              value: state.isSwitch,
                              onChanged: (newValue) {
                                print(newValue);
                                context
                                    .read<SwitchBloc>()
                                    .add(EnableOrDisableNotification());
                              });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Container(
                        height: 200,
                        color: Colors.red.withOpacity(state.mySlider),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.mySlider != current.mySlider,
                    builder: (context, state) {
                      print("Slider");
                      return Slider(
                          value: state.mySlider,
                          onChanged: (value) {
                            context
                                .read<SwitchBloc>()
                                .add(SliderOpacity(slider: value));
                          });
                    },
                  ),
                  Text(
                    state.counter.toString(),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementCounter());
                          },
                          child: const Text("Increment")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementCounter());
                          },
                          child: const Text("Decrement")),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
