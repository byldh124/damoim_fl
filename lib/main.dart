import 'package:damoim/application/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/injector.dart';

void main() {
  setUpInjection();
  runApp(const ProviderScope(child: MyApp()));
}

void setUpInjection() {
  initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: route,
    );
  }
}