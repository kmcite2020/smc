import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/ui/back_floating_button.dart';
import 'package:smc/core/ui/open_drawer_button.dart';
import 'package:smc/er/er_drawer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ERPage extends ReactiveStatelessWidget {
  const ERPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ButtonBar(
        children: [
          OpenDrawerFloatingButton(),
          BackFloatingButton(),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'EMERGENCY ROOM'.textify(),
      ),
      drawer: const ERDrawer(),
    );
  }
}
