import 'package:counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_app/bloc/imagepickerbloc/image_picker_bloc.dart';
import 'package:counter_app/bloc/movies_response_bloc/movies_bloc.dart';
import 'package:counter_app/bloc/post_api_bloc/api_bloc.dart';
import 'package:counter_app/bloc/switch_example/switch_bloc.dart';
import 'package:counter_app/bloc/to_do_bloc/to_do_bloc.dart';
import 'package:counter_app/bloc/user_data_fetching/user_data_bloc.dart';
import 'package:counter_app/ui/counter_screen.dart';
import 'package:counter_app/ui/movies_response_ui.dart';
import 'package:counter_app/ui/user_details.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()),
        // BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => Imagepickerbloc(ImagePickerUtils())),
        BlocProvider(
          create: (_) => ToDoBloc(),
        ),
        BlocProvider(
          create: (_) => ApiBloc(),
        ),
        BlocProvider(create: (_) => UserDataBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
