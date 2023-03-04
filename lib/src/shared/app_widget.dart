import 'package:bid365/src/shared/stores/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login/');
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode.value,
      theme: lightTheme,
      darkTheme: dartTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
