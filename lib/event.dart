import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final int importance;
  final int duration;
  final DateTime deadline;
  final Color backgroundColor;

  const Event({
    required this.title,
    required this.description,
    required this.importance,
    required this.duration,
    required this.deadline,
    required this.backgroundColor,
  });
}
