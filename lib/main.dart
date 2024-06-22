import 'dart:ui';

import 'package:cubit_go_router/core/cubit_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/app_settings_manager/barrel_app_settings.dart';
import 'core/l10n/app_localizations.dart';
import 'core/navigation/app_router.dart';
import 'package:screen1/screen1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = MyCubitObserver(); // Register the custom Cubit observer

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppSettingsManagerCubit(),
      child: BlocBuilder<AppSettingsManagerCubit, AppSettingsManagerState>(
        builder: (context, state) {
          final cubit = context.read<AppSettingsManagerCubit>();
          late final appRouter = AppRouter(appSettingsManagerState: state);
          final router = appRouter.router;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
              Screen1Localization.delegate
            ],
            locale: cubit.getLanguage(context),
            theme: cubit.getTheme(context),
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
