import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/er/presentation/arrival_datetime.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/patient.dart';
import '../../bloc/management_bloc.dart';

class InvestigationsView extends ReactiveStatelessWidget {
  const InvestigationsView({
    super.key,
    required this.patient,
  });
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...patient.investigations.values.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    ArrivalDateTimeView(dateTime: e.time).pad(),
                    e.name.textify().pad(),
                    e.value.textify().pad(),
                    IconButton(
                      onPressed: () {
                        managementBloc.removeInvestigation(
                          investigation: e,
                          patientID: patient.mr,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                controller: managementBloc.investigationName.controller,
                decoration: const InputDecoration(
                  labelText: 'Advised Investigaion',
                ),
              ).pad(),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                controller: managementBloc.investigationValue.controller,
                decoration: const InputDecoration(
                  labelText: 'Result',
                ),
              ).pad(),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  managementBloc.addInvestigation(patientID: patient.mr);
                },
                icon: const Icon(Icons.add),
              ).pad(),
            ),
          ],
        )
      ],
    );
  }
}
