import 'package:exercises/core/services/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:exercises/core/navigation/route_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Mi Socio',
      theme: ThemeData(useMaterial3: true),
    );
  }
}