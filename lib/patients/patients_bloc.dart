import 'package:smc/patients/patients_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core/common.dart';
import 'models/patient_model.dart';

final PatientsBloc patientsBloc = PatientsBloc();

class PatientsBloc {
  final patientsRM = RM.injectFuture(
    () async => PatientsState(
      patients: [],
    ),
    persist: () => PersistState(
      key: 'patients',
      toJson: (s) => s.toJson(),
      fromJson: (json) => PatientsState.fromJson(json),
    ),
  );

  String get patientId => randomID;
  PatientsState get state => patientsRM.state;
  set emit(PatientsState x) => patientsRM.state = x;
  bool get isWaiting => patientsRM.isWaiting;

  /// getters
  List<PatientModel> get patients => state.patients;
  bool isPatientPresent(PatientModel value) {
    if (patients.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  /// setters
  set addPatient(PatientModel? value) {
    log(value.toString());
    if (value == null) return;
    value.copyWith(id: patientId);
    emit = state.copyWith(
      patients: [value, ...patients],
    );
  }

  /// possible ages list
  final agesList = List.generate(100, (index) => index + 1);

  final patientName = RM.injectTextEditing();
  final patientDetails = RM.injectTextEditing();
  late final patientAge = RM.injectFormField(agesList.first);
}

final CurrentlySelectedPatientBloc currentlySelectedPatientBloc = CurrentlySelectedPatientBloc();

class CurrentlySelectedPatientBloc {
  final currentPatientRM = RM.inject(
    () => PatientModel(),
    persist: () => PersistState(
      key: 'currentPatient',
      toJson: (s) => s.toJson(),
      fromJson: (json) => PatientModel.fromJson(json),
    ),
  );
  set patient(PatientModel value) {
    log(value.toString());
    currentPatientRM.state = value;
  }

  PatientModel get patient => currentPatientRM.state;
  void selectPatient(PatientModel value) {
    patient = value;
  }

  void editPatient(PatientModel value) {
    patient = value;

    if (!patientsBloc.isPatientPresent(value)) {
      return;
    }
  }

  late final patientName = RM.injectTextEditing(text: patient.name);
  late final patientDetails = RM.injectTextEditing(text: patient.details);
  late final patientAge = RM.injectFormField(patient.age);
}
