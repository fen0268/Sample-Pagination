import 'package:flutter/material.dart';

@immutable
class People {
  const People({
    required this.family,
    required this.name,
  });

  final String family;
  final String name;

  factory People.fromJson(dynamic json) {
    return People(
      family: json['family'] as String,
      name: json['name'] as String,
    );
  }
}
