import 'package:counter_app/bloc/movies_response_bloc/movies_bloc.dart';
import 'package:counter_app/bloc/movies_response_bloc/movies_events.dart';
import 'package:counter_app/bloc/movies_response_bloc/movies_state.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesResponseUi extends StatefulWidget {
  const MoviesResponseUi({super.key});

  @override
  State<MoviesResponseUi> createState() => _MoviesResponseUiState();
}

class _MoviesResponseUiState extends State<MoviesResponseUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(MoviesFetchingEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  TextFormField(
                    onChanged: (value) {
                      BlocProvider.of<MoviesBloc>(context)
                          .add(MoviesSearchEvents(value));
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the movies names",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: state.tempMoviesList == null
                            ? state.movieResponse?.length
                            : state.tempMoviesList?.length,
                        itemBuilder: (context, index) {
                          if (state.tempMoviesList == null) {
                            final items = state.movieResponse?[index];
                            return Column(children: [
                              Card(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                      "https://image.tmdb.org/t/p/original${items?.posterPath}"),
                                ),
                              ),
                              Text(
                                items?.title ?? '',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ]);
                          } else {
                            final items = state.tempMoviesList?[index];
                            return Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    height: 120,
                                    width: 100,
                                    fit: BoxFit.fill,
                                    "https://image.tmdb.org/t/p/original${items?.posterPath}"),
                              ),
                              Text(
                                items?.title ?? '',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ]);
                          }
                        }),
                  ),
                ]),
              );
          }
        },
      ),
    );
  }
}
