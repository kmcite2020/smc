// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Medicine extends Equatable {
  final String medicine;
  const Medicine({
    this.medicine = '',
  });

  Medicine copyWith({
    String? medicine,
  }) {
    return Medicine(
      medicine: medicine ?? this.medicine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicine': medicine,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      medicine: map['medicine'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) => Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [medicine];
}
