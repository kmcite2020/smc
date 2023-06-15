import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/patient.dart';
import '../../../domain/triage.dart';
import '../../bloc/patients_bloc.dart';

class TriageView extends ReactiveStatelessWidget {
  const TriageView({
    super.key,
    required this.patient,
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: patient.triage,
      items: Triage.values
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: e.textify(),
            ),
          )
          .toList(),
      onChanged: (value) {
        patientsBloc.updateTriage(
          triage: value,
          mr: patient.mr,
        );
      },
    ).pad();
  }
}
