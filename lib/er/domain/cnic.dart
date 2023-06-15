// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CNIC extends Equatable {
  final String a;
  final String b;
  final String c;
  const CNIC({
    this.a = '',
    this.b = '',
    this.c = '',
  });
  @override
  String toString() => "$a-$b-$c";

  CNIC copyWith({
    String? a,
    String? b,
    String? c,
  }) {
    return CNIC(
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a': a,
      'b': b,
      'c': c,
    };
  }

  factory CNIC.fromMap(Map<String, dynamic> map) {
    return CNIC(
      a: map['a'] as String,
      b: map['b'] as String,
      c: map['c'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CNIC.fromJson(String source) => CNIC.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [a, b, c];
}
