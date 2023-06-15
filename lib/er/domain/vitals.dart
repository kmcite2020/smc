// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Vitals extends Equatable {
  final int systolic;
  final int diastolic;
  final double temp;
  final int pulse;
  final int sats;
  const Vitals({
    this.systolic = 120,
    this.diastolic = 80,
    this.temp = 98.6,
    this.pulse = 72,
    this.sats = 98,
  });

  Vitals copyWith({
    int? systolic,
    int? diastolic,
    double? temp,
    int? pulse,
    int? sats,
  }) {
    return Vitals(
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      temp: temp ?? this.temp,
      pulse: pulse ?? this.pulse,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'systolic': systolic,
      'diastolic': diastolic,
      'temp': temp,
      'pulse': pulse,
      'sats': sats,
    };
  }

  factory Vitals.fromMap(Map<String, dynamic> map) {
    return Vitals(
      systolic: map['systolic'] as int,
      diastolic: map['diastolic'] as int,
      temp: map['temp'] as double,
      pulse: map['pulse'] as int,
      sats: map['sats'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vitals.fromJson(String source) => Vitals.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      systolic,
      diastolic,
      temp,
      pulse,
      sats,
    ];
  }
}
