import 'package:flutter/material.dart';

@immutable
class Content {
  const Content({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  factory Content.fromJson(dynamic json) {
    return Content(
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }
}
