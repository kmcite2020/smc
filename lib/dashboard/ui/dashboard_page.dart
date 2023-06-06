import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/router.dart';
import 'package:smc/core/ui/loading_widget.dart';
import 'package:smc/dashboard/ui/hospital_information_dialog.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/common.dart';
import '../../settings/ui/settings_page.dart';
import 'info_widgets.dart';

class DashboardPage extends ReactiveStatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: dashboardPageName.textify(),
      ),
      body: isWaiting ? const LoadingWidget() : const InfoWidgets(),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            tooltip: 'settings',
            heroTag: randomID,
            onPressed: () {
              router.toPageless(const SettingsPage());
            },
            child: const Icon(Icons.settings),
          ),
          FloatingActionButton(
            tooltip: 'hospital info',
            heroTag: randomID,
            onPressed: () {
              router.toDialog(
                const HospitalInformationDialog(),
                barrierColor: Colors.black87,
              );
            },
            child: const Icon(Icons.local_hospital),
          ),
        ],
      ),
    );
  }
}
