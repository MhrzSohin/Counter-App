import 'dart:convert';

import 'package:counter_app/model/user_data_model/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserDataRepository {
  Future<List<UserDataModel>> fetchUserData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((e) {
        return UserDataModel(
          name: e["name"] as String,
          username: e['username'] as String,
          phone: e["phone"] as String,
          website: e["website"] as String,
          email: e["email"] as String,
        );
      }).toList();
    }
    throw Exception("Error While Data Fetching");
  }
}
