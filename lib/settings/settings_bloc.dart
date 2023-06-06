import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:smc/settings/models/flex_scheme_x.dart';
import 'package:smc/settings/settings_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final SettingsBloc settingsBloc = SettingsBloc();

class SettingsBloc {
  final settingsRM = RM.injectFuture(
    () async => SettingsState(),
    initialState: SettingsState(),
    persist: () => PersistState(
      key: 'settings',
      toJson: (s) => s.toJson(),
      fromJson: (json) => SettingsState.fromJson(json),
    ),
  );
  SettingsState get state => settingsRM.state;
  set emit(SettingsState x) => settingsRM.state = x;
  bool get isWaiting => settingsRM.isWaiting;

  /// getters
  bool get isDark => state.isDark;
  FlexScheme get flexScheme => state.flexSchemeX.flexScheme;
  double get borderRadius => state.borderRadius;

  /// setters
  set isDark(bool value) => emit = state.copyWith(isDark: value);
  set flexScheme(FlexScheme value) => emit = state.copyWith(flexSchemeX: FlexSchemeX(flexScheme: value));
  set borderRadius(double value) => emit = state.copyWith(borderRadius: value);
}
