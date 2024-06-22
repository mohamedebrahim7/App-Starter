import 'package:equatable/equatable.dart';

enum NavigationState { onLogin, onHome, onBoarding }

enum LanguageCode { en, ar, system }

enum AppThemeMode { dark, light, system }

class AppSettingsManagerState extends Equatable {
  final NavigationState navigationState;
  final AppThemeMode themeMode; // Update type to AppThemeMode
  final bool isGuest;
  final LanguageCode language;

  // Default constructor with default values
  const AppSettingsManagerState({
    this.navigationState = NavigationState.onBoarding,
    this.themeMode = AppThemeMode.system,
    this.language = LanguageCode.system,
    this.isGuest = false,
  });

  AppSettingsManagerState copyWith({
    NavigationState? navigationState,
    AppThemeMode? themeMode, // Update type to AppThemeMode
    bool? isGuest,
    LanguageCode? language,
  }) {
    return AppSettingsManagerState(
      navigationState: navigationState ?? this.navigationState,
      themeMode: themeMode ?? this.themeMode,
      isGuest: isGuest ?? this.isGuest,
      language: language ?? this.language,
    );
  }

  @override
  String toString() {
    return 'AppSettingsManagerState { state: $navigationState, themeMode: $themeMode, isGuest: $isGuest, language: $language }';
  }

  @override
  List<Object?> get props => [navigationState, themeMode, isGuest, language];
}
