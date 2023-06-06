import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:smc/settings/settings_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/ui/back_floating_button.dart';

class SettingsPage extends ReactiveStatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const BackFloatingButton(),
      appBar: AppBar(
        title: 'Settings'.textify(),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: 'DARK MODE'.textify(),
            subtitle: 'change to light or dark mode'.textify(),
            value: settingsBloc.isDark,
            onChanged: (value) {
              settingsBloc.isDark = value;
            },
          ).pad,
          DropdownButtonFormField(
            value: settingsBloc.flexScheme,
            items: FlexScheme.values.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: e.textify(),
                );
              },
            ).toList(),
            onChanged: (value) {
              settingsBloc.flexScheme = value!;
            },
          ).pad,
          CupertinoSlider(
            value: settingsBloc.borderRadius,
            min: 0,
            max: 30,
            thumbColor: Theme.of(context).primaryColor,
            onChanged: (_) {
              settingsBloc.borderRadius = _;
            },
          ).pad
        ],
      ),
    );
  }
}
