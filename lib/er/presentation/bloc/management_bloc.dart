import 'package:smc/er/domain/investigation.dart';
import 'package:smc/er/domain/management.dart';
import 'package:smc/er/presentation/bloc/patients_bloc.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../domain/patient.dart';

final ManagementBloc managementBloc = ManagementBloc();

class ManagementBloc {
  final management = RM.injectTextEditing();
  void addManagement({
    required MR patientID,
  }) {
    patientsBloc.patientsRM.setState(
      (s) {
        final now = DateTime.now();
        final psC = s.copyWith();
        final pC = psC.patients[patientID]!;
        final upC = pC.copyWith(
          managements: {
            ...pC.managements,
            now: Management(description: management.value, time: now),
          },
        );
        return psC.copyWith(
          patients: {
            ...psC.patients,
            upC.mr: upC,
          },
        );
      },
    );
  }

  void removeManagement({
    required Management management,
    required MR patientID,
  }) {
    patientsBloc.patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[patientID]!;

        final updatedPatientCopy = patientCopy.copyWith(
          managements: {...patientCopy.managements}..remove(management.time),
        );
        return patientsCopy.copyWith(
          patients: {
            ...patientsCopy.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
      },
    );
  }

  final investigationName = RM.injectTextEditing();
  final investigationValue = RM.injectTextEditing();

  void addInvestigation({
    required MR patientID,
  }) {
    patientsBloc.patientsRM.setState(
      (s) {
        final now = DateTime.now();
        final psC = s.copyWith();
        final pC = psC.patients[patientID]!;
        final upC = pC.copyWith(
          investigations: {
            ...pC.investigations,
            now: Investigation(
              name: investigationName.value,
              value: investigationValue.value,
              time: now,
            ),
          },
        );
        return psC.copyWith(
          patients: {
            ...psC.patients,
            upC.mr: upC,
          },
        );
      },
    );
  }

  void removeInvestigation({
    required Investigation investigation,
    required MR patientID,
  }) {
    patientsBloc.patientsRM.setState(
      (s) {
        final patientsCopy = s.copyWith();
        final patientCopy = patientsCopy.patients[patientID]!;

        final updatedPatientCopy = patientCopy.copyWith(
          investigations: {...patientCopy.investigations}..remove(investigation.time),
        );
        return patientsCopy.copyWith(
          patients: {
            ...patientsCopy.patients,
            updatedPatientCopy.mr: updatedPatientCopy,
          },
        );
      },
    );
  }
}
