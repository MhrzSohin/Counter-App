import 'dart:convert';

import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromMap(Map<String, dynamic> data) => Company(
        name: data['name'] as String?,
        catchPhrase: data['catchPhrase'] as String?,
        bs: data['bs'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Company].
  factory Company.fromJson(String data) {
    return Company.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Company] to a JSON string.
  String toJson() => json.encode(toMap());

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
