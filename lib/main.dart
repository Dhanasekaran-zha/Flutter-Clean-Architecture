import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/app/app.dart';
import 'package:flutter_pokedex/src/app/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
