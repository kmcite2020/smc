import 'package:flutter/material.dart';
import 'package:smc/core/data_source.dart';
import 'package:smc/core/router.dart';
import 'package:smc/core/theme.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  await RM.storageInitializer(HiveDataSource());
  // await RM.deleteAllPersistState();
  runApp(const MyApp());
}

class MyApp extends ReactiveStatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
