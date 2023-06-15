import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';

class HospitalInformationDialog extends StatelessWidget {
  const HospitalInformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Name'.textify(),
          'SUBHAN MEDICAL CENTER'.textify(textScaleFactor: 1.4),
          'Services'.textify(),
          'FIRST AID'.textify(textScaleFactor: 1.4),
          'MINOR OT'.textify(textScaleFactor: 1.4),
          'GENERAL PHYSICIANS'.textify(textScaleFactor: 1.4),
          'MATERNITY HOME'.textify(textScaleFactor: 1.4),
          '24 HOURS SERVICE.'.textify(textScaleFactor: 1.4),
          'ULTRASOUND'.textify(textScaleFactor: 1.4),
          'Location'.textify(),
          'GANGODHER PUL NARANJI'.textify(textScaleFactor: 1.4),
          'Incharge'.textify(),
          'DR. FAZLE SUBHAN'.textify(textScaleFactor: 1.4),
        ],
      ).pad(),
    );
  }
}
