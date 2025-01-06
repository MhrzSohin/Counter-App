import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:counter_app/model/movie_model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Result>> fetchDataFromAPI() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/movie/popular'),
          headers: {
            });
      if (response.statusCode == 200) {
        final moviemodel = movieModelFromJson(response.body);
        print(moviemodel.results);
        return moviemodel.results ?? [];
        // final body = json.decode(response.body) as List;
        // return body.map((e) {
        //   return Result(
        //     posterPath: e['posterPath'] as String,
        //     title: e['title'] as String,
        //   );
        // }).toList();
      }
    } on TimeoutException {
      throw Exception("Error occurs time out");
    } on SocketException {
      throw Exception("Error occurs socket problems");
    }
    throw Exception("Error occurs while fetching data");
  }
}
