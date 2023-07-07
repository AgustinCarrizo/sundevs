import 'package:flutter/material.dart';
import 'package:sundevs/dio/connectionprovider.dart';
import 'package:sundevs/screens/screens.dart';
import 'package:sundevs/widget/custom_appbar.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return WaitingScreen.route();
      case ComicScreen.routeName:
        return ComicScreen.route();  
      case WaitingScreen.routeName:
        return WaitingScreen.route();    
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
