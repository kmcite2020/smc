// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'models/patient_model.dart';

class PatientsState {
  final List<PatientModel> patients;
  PatientsState({
    this.patients = const [],
  });

  PatientsState copyWith({
    List<PatientModel>? patients,
  }) {
    return PatientsState(
      patients: patients ?? this.patients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patients': patients.map((x) => x.toMap()).toList(),
    };
  }

  factory PatientsState.fromMap(Map<String, dynamic> map) {
    return PatientsState(
      patients: List<PatientModel>.from(
        (map['patients']).map<PatientModel>(
          (x) => PatientModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientsState.fromJson(String source) => PatientsState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PatientsModel(patients: $patients)';

  @override
  bool operator ==(covariant PatientsState other) {
    if (identical(this, other)) return true;

    return listEquals(other.patients, patients);
  }

  @override
  int get hashCode => patients.hashCode;
}
