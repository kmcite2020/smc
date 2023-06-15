// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Management extends Equatable {
  final String description;
  final DateTime time;
  const Management({
    required this.description,
    required this.time,
  });

  Management copyWith({
    String? description,
    DateTime? time,
  }) {
    return Management(
      description: description ?? this.description,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Management.fromMap(Map<String, dynamic> map) {
    return Management(
      description: map['description'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Management.fromJson(String source) => Management.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [description, time];
}
