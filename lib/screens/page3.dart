import 'package:cubit_go_router/core/navigation/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n/app_localizations.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key, });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('page 3'),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(l10n.hello),),
            ElevatedButton(onPressed: () {
              context.pushNamed(screen1RoutePath);
            }, child: Text('go to screen 1'),
            )
         ],
        ));
  }
}

