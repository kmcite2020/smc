// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Investigation extends Equatable {
  final DateTime time;
  final String name;
  final String value;
  const Investigation({
    required this.time,
    required this.name,
    required this.value,
  });

  Investigation copyWith({
    DateTime? time,
    String? name,
    String? value,
  }) {
    return Investigation(
      time: time ?? this.time,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'name': name,
      'value': value,
    };
  }

  factory Investigation.fromMap(Map<String, dynamic> map) {
    return Investigation(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      name: map['name'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Investigation.fromJson(String source) => Investigation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [time, name, value];
}
