import 'package:cubit_go_router/screens/page3.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/onboarding_screen.dart';
import '../../screens/page4.dart';
import '../app_settings_manager/barrel_app_settings.dart';
import 'package:screen1/screen1.dart';
import 'constants.dart';

class AppRouter {
  final AppSettingsManagerState appSettingsManagerState;

  AppRouter({required this.appSettingsManagerState});

  String? initialLocation() {
    switch (appSettingsManagerState.navigationState) {
      case NavigationState.onLogin:
        return loginRoutePath;
      case NavigationState.onHome:
        return homeRoutePath;
      case NavigationState.onBoarding:
        return onBoardingRoutePath;
    }
  }

  late final router = GoRouter(
    initialLocation: initialLocation(),
    routes: [
      GoRoute(
        path: loginRoutePath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: onBoardingRoutePath,
        path: onBoardingRoutePath,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
          name: homeRoutePath,
          path: homeRoutePath,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                name: page3RoutePath,
                path: page3RoutePath,
                builder: (context, state) => const Page3(),
                routes: [
                  GoRoute(
                    name: screen1RoutePath,
                    path: screen1RoutePath,
                    builder: (context, state) => Screen1(
                        onGoPage3tap: () => context.pushNamed(pag4RoutePath)),
                    routes: [
                      GoRoute(
                        name: pag4RoutePath,
                        path: pag4RoutePath,
                        builder: (context, state) => const Page4(),
                      )
                    ]
                  )
                ]),
          ]),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
