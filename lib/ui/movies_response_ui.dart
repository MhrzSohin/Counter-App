import 'package:flutter/material.dart';

class MoviesResponseUi extends StatefulWidget {
  const MoviesResponseUi({super.key});

  @override
  State<MoviesResponseUi> createState() => _MoviesResponseUiState();
}

class _MoviesResponseUiState extends State<MoviesResponseUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          TextFormField(
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
                    crossAxisCount: 4),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(index.toString()),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
