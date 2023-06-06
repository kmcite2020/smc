import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:smc/settings/settings_bloc.dart';

ThemeData get theme {
  if (settingsBloc.isDark) {
    return FlexThemeData.dark(
      scheme: settingsBloc.flexScheme,
      useMaterial3: true,
      darkIsTrueBlack: true,
      subThemesData: FlexSubThemesData(
        defaultRadius: settingsBloc.borderRadius,
        drawerBackgroundSchemeColor: SchemeColor.primary,
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
        ),
      ),
    );
  } else {
    return FlexThemeData.light(
      scheme: settingsBloc.flexScheme,
      useMaterial3: true,
      lightIsWhite: false,
      subThemesData: FlexSubThemesData(
        defaultRadius: settingsBloc.borderRadius,
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
        ),
      ),
    );
  }
}
