// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'medicine.dart';

class Prescription extends Equatable {
  final String id;
  final String name;
  final Medicine medicine;
  final String dose;
  final String instructions;
  const Prescription({
    required this.id,
    this.name = '',
    this.medicine = const Medicine(),
    this.dose = '',
    this.instructions = '',
  });

  Prescription copyWith({
    String? id,
    String? name,
    Medicine? medicine,
    String? dose,
    String? instructions,
  }) {
    return Prescription(
      id: id ?? this.id,
      name: name ?? this.name,
      medicine: medicine ?? this.medicine,
      dose: dose ?? this.dose,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'medicine': medicine.toMap(),
      'dose': dose,
      'instructions': instructions,
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      id: map['id'] as String,
      name: map['name'] as String,
      medicine: Medicine.fromMap(map['medicine'] as Map<String, dynamic>),
      dose: map['dose'] as String,
      instructions: map['instructions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prescription.fromJson(String source) => Prescription.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      medicine,
      dose,
      instructions,
    ];
  }
}
