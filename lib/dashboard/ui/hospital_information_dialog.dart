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
          'SUBHAN MEDICAL CENTER'.textify(1.4),
          'Services'.textify(),
          'FIRST AID'.textify(1.4),
          'MINOR OT'.textify(1.4),
          'GENERAL PHYSICIANS'.textify(1.4),
          'MATERNITY HOME'.textify(1.4),
          '24 HOURS SERVICE.'.textify(1.4),
          'ULTRASOUND'.textify(1.4),
          'Location'.textify(),
          'GANGODHER PUL NARANJI'.textify(1.4),
          'Incharge'.textify(),
          'DR. FAZLE SUBHAN'.textify(1.4),
        ],
      ).pad,
    );
  }
}
