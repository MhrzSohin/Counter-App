import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'address.dart';
import 'company.dart';

class UserDataModel extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  const UserDataModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> data) => UserDataModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        website: data['website'] as String?,
        company: data['company'] == null
            ? null
            : Company.fromMap(data['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toMap(),
        'phone': phone,
        'website': website,
        'company': company?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDataModel].
  factory UserDataModel.fromJson(String data) {
    return UserDataModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserDataModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      email,
      address,
      phone,
      website,
      company,
    ];
  }
}
