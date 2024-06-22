import 'package:flutter/material.dart';
import 'package:screen1/screen1.dart';

class Screen1 extends StatelessWidget {
  final VoidCallback onGoPage3tap;

  const Screen1({super.key, required this.onGoPage3tap});

  @override
  Widget build(BuildContext context) {
    final l10n = Screen1Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen 1'),
      ),
      body: Column(children: [
        Text(l10n.screen1),
        ElevatedButton(
          onPressed: onGoPage3tap,
          child: Text(l10n.go2ndscren),
        )
      ]),
    );
  }
}
