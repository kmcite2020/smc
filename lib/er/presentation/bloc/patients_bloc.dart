import 'package:smc/er/domain/classification.dart';
import 'package:smc/er/domain/complaint.dart';
import 'package:smc/er/domain/gender.dart';
import 'package:smc/er/domain/patients.dart';
import 'package:smc/er/domain/triage.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../core/common.dart';
import '../../domain/cnic.dart';
import '../../domain/patient.dart';

final PatientsBloc patientsBloc = PatientsBloc();

class PatientsBloc {
  final patientsRM = RM.inject(
    () => Patients(),
  );

  Patients get x => patientsRM.state;

  List<Patient> get patients => x.patients.values.toList();

  bool get isWaiting => patientsRM.isWaiting;
  bool get isEmpty => patients.isEmpty;
  late final pageController = RM.injectTabPageView(length: patients.length);

  void addPatient(Patient patient) {
    patientsRM.setState((s) => s.addPatient(patient));
  }

  void removePatient(Patient patient) {
    patientsRM.setState((s) => s.removePatient(patient));
  }

  /// PATIENT ATTENDING
  void onAttentionChanged(bool? value, MR patientID) {
    patientsRM.setState(
      (s) {
        return s.copyWith().copyWith(
          patients: {
            ...s.patients,
            s
                .copyWith()
                .patients[patientID]!
                .copyWith(
                  isAttended: value,
                )
                .mr: s.copyWith().patients[patientID]!.copyWith(
                  isAttended: value,
                ),
          },
        );
      },
    );
  }

  /// CNIC CHANGED
  void onCnicChanged(String? a, String? b, String? c, MR patientID) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[patientID]!;
        final updatedPatientCopy = patientCopy.copyWith(
          cnic: CNIC(
            a: a ?? patientCopy.cnic.a,
            b: b ?? patientCopy.cnic.b,
            c: c ?? patientCopy.cnic.c,
          ),
        );
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  /// TRIAGE CLASS GENDER
  void updateGender({required Gender? gender, required MR mr}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[mr]!;
        final updatedPatientCopy = patientCopy.copyWith(gender: gender);
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  void updateDiagnosis({required String? diagnosis, required MR mr}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[mr]!;
        final updatedPatientCopy = patientCopy.copyWith(diagnosis: diagnosis);
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  void updateProvisionalDiagnosis({required String? provisionalDiagnosis, required MR mr}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[mr]!;
        final updatedPatientCopy = patientCopy.copyWith(provisionalDiagnosis: provisionalDiagnosis);
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  void updateClassification({required Classification? classification, required MR mr}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[mr]!;
        final updatedPatientCopy = patientCopy.copyWith(
          classification: classification,
        );
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  void updateTriage({required Triage? triage, required MR mr}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[mr]!;
        final updatedPatientCopy = patientCopy.copyWith(triage: triage);
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  /// UPDATE NAME
  void updateName({required String name, required MR patientID}) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[patientID]!;
        final updatedPatientCopy = patientCopy.copyWith(name: name);
        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
        return updatedPatientsCopy;
      },
    );
  }

  /// CURRENT COMPLAINTS
  void updateComplaints(List<Complaint> complaints, MR patientID) {
    patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[patientID]!;
        final complaintsCopy = List<Complaint>.from(
          patientCopy.presentingComplaints,
        );

        complaintsCopy.addAll(complaints);

        final updatedPatientCopy = patientCopy.copyWith(
          presentingComplaints: complaintsCopy,
        );

        final updatedPatientsCopy = patientsCopy.copyWith(
          patients: {
            ...s.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );

        return updatedPatientsCopy;
      },
    );
  }

  /// NEW PATIENT MANAGEMENT

  late final addPatientForm = RM.injectForm(
    submit: () async {
      final Patient patient = Patient(
        mr: randomID,
        arrivalAt: DateTime.now(),
      );
      addPatient(patient);
    },
  );
}
