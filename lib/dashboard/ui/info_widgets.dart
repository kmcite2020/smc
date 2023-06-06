import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/er/er_page.dart';
import 'package:smc/opd/opd_page.dart';
import 'package:smc/patients/patients_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/router.dart';
import '../../patients/ui/patients_page.dart';

class InfoWidgets extends ReactiveStatelessWidget {
  const InfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        // ElevatedButton.icon(
        //   icon: const Icon(Icons.dock),
        //   onPressed: () {},
        //   label: 'MO'.textify(),
        // ).pad,
        // ElevatedButton(
        //   onPressed: () {},
        //   child: 'WMO'.textify(),
        // ).pad,
        Container(
          color: Colors.lightBlue.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'Total Patients'.textify().pad,
              '${patientsBloc.patients.length}'.textify(2.4),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  router.toPageless(const PatientsPage());
                },
                child: 'Go to Patients'.textify(),
              ).pad,
            ],
          ),
        ).pad,
        Container(
          color: Colors.lightBlue.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'OPD'.textify().pad,
              '${patientsBloc.patients.length}'.textify(2.4),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  router.toPageless(const OPDPage());
                },
                child: 'Go to Patients'.textify(),
              ).pad,
            ],
          ),
        ).pad,
        Container(
          color: Colors.lightBlue.withOpacity(0.1),
          child: Column(
            children: [
              'Emergency Room'.textify().pad,
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  router.toPageless(const ERPage());
                },
                child: 'ER Utilities'.textify(),
              ).pad,
            ],
          ),
        ).pad,
      ],
    );
  }
}