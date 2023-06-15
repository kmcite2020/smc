// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'patient.dart';

class Patients {
  final Map<MR, Patient> patients;
  Patients({
    this.patients = const {},
  });

  Patients copyWith({
    Map<MR, Patient>? patients,
  }) {
    return Patients(
      patients: patients ?? this.patients,
    );
  }

  Patients addPatient(Patient patient) {
    return copyWith(patients: {
      patient.mr: patient,
      ...patients,
    });
  }

  Patients removePatient(Patient patient) {
    Map<MR, Patient> temp = {};
    temp.addAll(patients);
    temp.remove(patient.mr);
    return copyWith(patients: temp);
  }
}
