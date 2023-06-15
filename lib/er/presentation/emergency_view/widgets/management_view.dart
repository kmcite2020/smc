import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../domain/management.dart';
import '../../../domain/patient.dart';
import '../../arrival_datetime.dart';
import '../../bloc/management_bloc.dart';

class ManagementView extends ReactiveStatelessWidget {
  const ManagementView({
    Key? key,
    required this.managements,
    required this.mr,
  }) : super(key: key);
  final Map<DateTime, Management> managements;
  final MR mr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: managements.values.map(
            (e) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ArrivalDateTimeView(dateTime: e.time).pad(),
                  IconButton(
                    onPressed: () {
                      managementBloc.removeManagement(management: e, patientID: mr);
                    },
                    icon: const Icon(Icons.delete),
                  ).pad(),
                  e.description.textify().pad(),
                ],
              );
            },
          ).toList(),
        ),
        TextField(
          controller: managementBloc.management.controller,
          decoration: InputDecoration(
            labelText: 'Add Management Notes',
            suffixIcon: IconButton(
              onPressed: () {
                managementBloc.addManagement(
                  patientID: mr,
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ).pad(),
      ],
    );
  }
}
