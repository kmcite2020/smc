// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:smc/patients/models/case_type.dart';
import 'package:smc/patients/models/presenting_complaints.dart';

class PatientModel {
  final String id;
  final String name;
  final String details;
  final PresentingComplaints presentingComplaints;
  final int age;
  final CaseX caseX;
  PatientModel({
    this.id = '',
    this.name = '',
    this.details = '',
    this.presentingComplaints = const PresentingComplaints(),
    this.age = 1,
    this.caseX = const CaseX(),
  });

  PatientModel copyWith({
    String? id,
    String? name,
    String? details,
    PresentingComplaints? presentingComplaints,
    int? age,
    CaseX? caseX,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      presentingComplaints: presentingComplaints ?? this.presentingComplaints,
      age: age ?? this.age,
      caseX: caseX ?? this.caseX,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
      'presentingComplaints': presentingComplaints.toMap(),
      'age': age,
      'caseX': caseX.toMap(),
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'] as String,
      name: map['name'] as String,
      details: map['details'] as String,
      presentingComplaints: PresentingComplaints.fromMap(map['presentingComplaints'] as Map<String, dynamic>),
      age: map['age'] as int,
      caseX: CaseX.fromMap(map['caseX'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) => PatientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientModel(id: $id, name: $name, details: $details, presentingComplaints: $presentingComplaints, age: $age, caseX: $caseX)';
  }

  @override
  bool operator ==(covariant PatientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.details == details &&
        other.presentingComplaints == presentingComplaints &&
        other.age == age &&
        other.caseX == caseX;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ details.hashCode ^ presentingComplaints.hashCode ^ age.hashCode ^ caseX.hashCode;
  }
}
