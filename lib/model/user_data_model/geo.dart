import 'dart:convert';

import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String? lat;
  final String? lng;

  const Geo({this.lat, this.lng});

  factory Geo.fromMap(Map<String, dynamic> data) => Geo(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lng': lng,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geo].
  factory Geo.fromJson(String data) {
    return Geo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Geo] to a JSON string.
  String toJson() => json.encode(toMap());

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [lat, lng];
}
