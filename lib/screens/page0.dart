import 'package:cubit_go_router/core/navigation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/app_settings_manager/barrel_app_settings.dart';
import '../core/l10n/app_localizations.dart';

class Page0 extends StatelessWidget {
  Page0({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        ThemeModePicker(),
        Divider(),
        LanguagePicker(),
        ElevatedButton(
          onPressed: () {
            context.read<AppSettingsManagerCubit>().goToLogin(context);
          },
          child: Text(l10n.logout),
        ),
        ElevatedButton(
          onPressed: context.watch<AppSettingsManagerCubit>().state.isGuest
              ? null
              : () => context.pushNamed(page3RoutePath),
          child: Text(l10n.goToPage3IfUser),
        )
      ],
    );
  }
}

class ThemeModePicker extends StatelessWidget {
  const ThemeModePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.watch<AppSettingsManagerCubit>();
    final groupValue = cubit.state.themeMode;
    return Column(
      children: [
        RadioListTile<AppThemeMode>(
          title: Text(l10n.lightTheme),
          value: AppThemeMode.light,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeThemeMode(value!);
          },
        ),
        RadioListTile<AppThemeMode>(
          title: Text(l10n.darkTheme),
          value: AppThemeMode.dark,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeThemeMode(value!);
          },
        ),
        RadioListTile<AppThemeMode>(
          title: Text(l10n.systemTheme),
          value: AppThemeMode.system,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeThemeMode(value!);
          },
        ),
      ],
    );
  }
}

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.watch<AppSettingsManagerCubit>();
    final groupValue = cubit.state.language;
    return Column(
      children: [
        RadioListTile<LanguageCode>(
          title: Text(l10n.english),
          value: LanguageCode.en,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeLanguage(value!);
          },
        ),
        RadioListTile<LanguageCode>(
          title: Text(l10n.arabic),
          value: LanguageCode.ar,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeLanguage(value!);
          },
        ) ,
        RadioListTile<LanguageCode>(
          title: Text(l10n.systemLanguage),
          value: LanguageCode.system,
          groupValue: groupValue,
          onChanged: (value) {
            cubit.changeLanguage(value!);
          },
        ),
      ],
    );
  }
}
