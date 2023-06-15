import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/patient.dart';
import '../../bloc/biodata_bloc.dart';

class AgeFieldView extends ReactiveStatelessWidget {
  const AgeFieldView({
    super.key,
    required this.patient,
  });

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: 'Age: ${(patient.age * 100).toInt()}',
      value: (patient.age).toDouble(),
      onChanged: (value) => bioDataBloc.onAgeChanged(
        age: value,
        mr: patient.mr,
      ),
    );
  }
}
