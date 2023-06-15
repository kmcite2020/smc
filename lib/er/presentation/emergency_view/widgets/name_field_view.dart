import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/patient.dart';
import '../../bloc/patients_bloc.dart';

class NameFieldView extends ReactiveStatelessWidget {
  const NameFieldView({
    super.key,
    required this.patient,
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: patient.name,
      onChanged: (value) {
        patientsBloc.updateName(
          name: value,
          patientID: patient.mr,
        );
      },
    ).pad();
  }
}
