import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/config/routes/app_router_config.dart';
import 'package:flutter_pokedex/src/config/theme/themes.dart';
import 'package:flutter_pokedex/src/constants/app_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      title: AppStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routerConfig: AppRouterConfig().getRouter(),
    );
  }
}
