// import 'package:smc/settings/settings_state.dart';
// import 'package:states_rebuilder/states_rebuilder.dart';

// final SettingsRepository settingsRepository = SettingsRepository();

// class SettingsRepository {
//   final settingsRM = RM.injectFuture(
//     () async => SettingsState(),
//     persist: () => PersistState(
//       key: 'settings',
//       toJson: (s) => s.toJson(),
//       fromJson: (json) => SettingsState.fromJson(json),
//     ),
//   );
//   Future<SettingsState> get settings => settingsRM.stateAsync;
// }
