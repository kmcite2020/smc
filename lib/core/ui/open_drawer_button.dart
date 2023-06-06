import 'package:flutter/material.dart';
import 'package:smc/core/common.dart';
import 'package:smc/core/router.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpenDrawerFloatingButton extends ReactiveStatelessWidget {
  const OpenDrawerFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Open Drawer',
      heroTag: randomID,
      onPressed: () {
        router.scaffold.openDrawer();
      },
      child: const Icon(Icons.book_sharp),
    );
  }
}
