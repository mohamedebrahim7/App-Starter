import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/app_settings_manager/barrel_app_settings.dart';
class LoginScreen extends StatelessWidget {
  final String? username;

  const LoginScreen({
    super.key,
    this.username,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen'),
            ElevatedButton(onPressed: (){
              context.read<AppSettingsManagerCubit>().goToHomeAsUser(context);
            }, child: Text('go to home as user'),
            ),
            ElevatedButton(onPressed: (){
              context.read<AppSettingsManagerCubit>().goToHomeAsGuest(context);
            }, child: Text('go to home as guest'),
            )
          ],
        ),
      ),
    );
  }

}
