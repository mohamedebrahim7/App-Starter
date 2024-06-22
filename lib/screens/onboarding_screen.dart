import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_settings_manager/barrel_app_settings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('onboarding screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('onBoarding Screen'),
              ElevatedButton(
                  onPressed: () {
                  context.read<AppSettingsManagerCubit>().goToLogin(context);
                  },
                   child: Text('skip on boarding'),
              )
            ],
          ),
        ),
      ),
    );
  }

}
