import 'dart:convert';

import 'package:collection/collection.dart';

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromMap(Map<String, dynamic> data) {
    return ProductionCountry(
      iso31661: data['iso_3166_1'] as String?,
      name: data['name'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'iso_3166_1': iso31661,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductionCountry].
  factory ProductionCountry.fromJson(String data) {
    return ProductionCountry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductionCountry] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductionCountry) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => iso31661.hashCode ^ name.hashCode;
}
