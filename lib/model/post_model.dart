import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  const PostModel({this.postId, this.id, this.name, this.email, this.body});

  factory PostModel.fromMap(Map<String, dynamic> data) => PostModel(
        postId: data['postId'] as int?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        body: data['body'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostModel].
  factory PostModel.fromJson(String data) {
    return PostModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PostModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PostModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
