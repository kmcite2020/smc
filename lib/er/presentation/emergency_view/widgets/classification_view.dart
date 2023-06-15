import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/classification.dart';
import '../../../domain/patient.dart';
import '../../bloc/patients_bloc.dart';

class ClassificationView extends ReactiveStatelessWidget {
  const ClassificationView({
    super.key,
    required this.patient,
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: patient.classification,
      items: Classification.values
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: e.textify(),
            ),
          )
          .toList(),
      onChanged: (value) {
        patientsBloc.updateClassification(
          classification: value,
          mr: patient.mr,
        );
      },
    ).pad();
  }
}
