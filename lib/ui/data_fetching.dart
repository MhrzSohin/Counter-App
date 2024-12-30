import 'package:counter_app/bloc/post_api_bloc/api_bloc.dart';
import 'package:counter_app/bloc/post_api_bloc/api_events.dart';
import 'package:counter_app/bloc/post_api_bloc/api_state.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataFetching extends StatefulWidget {
  const DataFetching({super.key});

  @override
  State<DataFetching> createState() => _DataFetchingState();
}

class _DataFetchingState extends State<DataFetching> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiBloc>(context).add(PostFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ApiBloc, ApiState>(
        listener: (context, state) {
          if (state.postStatus == PostStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("DataFetched Successfully"),
                backgroundColor: Colors.lightGreen));
          }
        },
        builder: (context, state) {
          return BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Center(child: Text(state.message.toString()));
                case PostStatus.success:
                  return ListView.builder(
                      itemCount: state.postlist.length,
                      itemBuilder: (context, index) {
                        final item = state.postlist[index];
                        return ListTile(
                          title: Text(item.email.toString()),
                          subtitle: Text(item.body.toString()),
                        );
                      });
              }
            },
          );
        },
      ),
    );
  }
}
