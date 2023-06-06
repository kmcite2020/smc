import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/core/ui/back_floating_button.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ERDrawer extends ReactiveStatelessWidget {
  const ERDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: const BackFloatingButton().pad,
          ),
          const Divider(),
          Material(
            child: 'EMERGENCY ROOM'.textify(2).pad,
          ),
          const Divider(),
          ElevatedButton(
            child: 'PEDS'.textify(3),
            onPressed: () {},
          ).pad,
          ElevatedButton(
            child: 'MEDICAL'.textify(3),
            onPressed: () {},
          ).pad,
          ElevatedButton(
            child: 'TRAUMA'.textify(3),
            onPressed: () {},
          ).pad,
          const Divider(),
          const Spacer(),
          const Divider(),
        ],
      ).pad,
    );
  }
}
