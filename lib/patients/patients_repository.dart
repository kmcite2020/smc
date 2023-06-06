// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:smc/patients/patient_model.dart';
// import 'package:smc/patients/patients_state.dart';
// import 'package:states_rebuilder/states_rebuilder.dart';

// final PatientsRepository patientsRepository = PatientsRepository();

// class PatientsRepository {
//   final patientsRM = RM.injectFuture(
//     () async => PatientsState(),
//     persist: () => PersistState(
//       key: 'patients',
//       toJson: (s) => s.toJson(),
//       fromJson: (json) => PatientsState.fromJson(json),
//     ),
//   );

//   Future<List<Patient>> get patients async => patientsRM.state.patients;
//   Future<void> addPatient(Patient patient) async {}

//   Future<void> deletePatient(Patient patient) async {
//     patientsSource.delete(patient.name);
//   }

//   Future<void> updatePatient(Patient modifiedPatient) async {}
//   // TODO - implement [updatePatient()]
// }
