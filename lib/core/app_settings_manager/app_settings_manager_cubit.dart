import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../navigation/constants.dart';
import 'app_settings_manager_state.dart';
import 'package:go_router/go_router.dart';

class AppSettingsManagerCubit extends HydratedCubit<AppSettingsManagerState> {
  AppSettingsManagerCubit() : super(const AppSettingsManagerState());

  @override
  AppSettingsManagerState fromJson(Map<String, dynamic> json) {
    return AppSettingsManagerState(
      navigationState: NavigationState.values[json['navigationState'] as int],
      themeMode: AppThemeMode.values[json['themeMode'] as int], // Deserialize theme mode
      language: LanguageCode.values[json['language'] as int], // Deserialize language
      isGuest: json['isGuest'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson(AppSettingsManagerState state) {
    return {
      'navigationState': state.navigationState.index,
      'themeMode': state.themeMode.index, // Serialize theme mode
      'language': state.language.index, // Serialize language
      'isGuest': state.isGuest,
    };
  }

  void goToLogin(BuildContext context)  {
    emit(state.copyWith(navigationState: NavigationState.onLogin));
    context.go(loginRoutePath);
  }

  void goToHomeAsGuest(BuildContext context)  {
    emit(state.copyWith(navigationState: NavigationState.onHome, isGuest: true));
    context.go(homeRoutePath);
  }

  void goToHomeAsUser(BuildContext context)  {
    emit(state.copyWith(navigationState: NavigationState.onHome, isGuest: false));
    context.go(homeRoutePath);
  }

  void changeThemeMode(AppThemeMode newThemeMode) {
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void changeLanguage(LanguageCode newLanguage) {
    emit(state.copyWith(language: newLanguage));
  }

  //todo change the flutter theme by your theme
  ThemeData getTheme(BuildContext context) {

    final ThemeData _lightTheme = ThemeData.light().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFBB86FC),
        onPrimary: Colors.black,
        secondary: Color(0xFF03DAC5),
        onSecondary: Colors.blue,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.greenAccent,
        onSurface: Colors.blueGrey,
      ),
    );

    final ThemeData _darkTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFBB86FC),
        onPrimary: Colors.black,
        secondary: Color(0xFF03DAC5),
        onSecondary: Colors.blue,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.black,
        onBackground: Colors.white,
        surface: Colors.greenAccent,
        onSurface: Colors.blueGrey,
      ),
    );

    final brightness = MediaQuery.platformBrightnessOf(context);
    switch (state.themeMode) {
      case AppThemeMode.light:
        return _lightTheme ;
      case AppThemeMode.dark:
        return _darkTheme ;
      case AppThemeMode.system:
        return brightness == Brightness.dark ? _darkTheme : _lightTheme;
      default:
        return ThemeData.light(); // Default to light theme
    }
  }

  Locale getLanguage(BuildContext context) {
    Locale deviceLocale = window.locale;// or html.window.locale
    String langCode = deviceLocale.languageCode;

    switch (state.language) {
      case LanguageCode.ar:
        return const Locale("ar");
      case LanguageCode.en:
        return const Locale("en");
      case LanguageCode.system:

        ///check if the system device is lang that we support
        ///no matter how much languages are supported
        if (langCode == "ar" || langCode == "en") {
          return Locale(langCode);
        }

        ///if not return en as default
        else {
          return const Locale("en");
        }
      default:
        return const Locale("en");
    }
  }
}
