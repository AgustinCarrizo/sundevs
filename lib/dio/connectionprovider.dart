
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:sundevs/utils/variable_static.dart';

class ConnectivityProvider extends ChangeNotifier {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _hasInternetConnection = false;

  bool get hasInternetConnection => _hasInternetConnection;

  ConnectivityProvider() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (_hasInternetConnection && result == ConnectivityResult.none) {
      _hasInternetConnection = false;
       NavigationService().show('You have no internet connection');
      notifyListeners();
    } else if (!_hasInternetConnection && result != ConnectivityResult.none) {
      _hasInternetConnection = true;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}