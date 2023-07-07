import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<ScaffoldMessengerState> navigatorKey =
      GlobalKey<ScaffoldMessengerState>();

  show(String? mensaje) {
    return navigatorKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Column(
          children: [
            Text(mensaje ?? ''),
          ],
        ),
      ),
    );
  }
}
