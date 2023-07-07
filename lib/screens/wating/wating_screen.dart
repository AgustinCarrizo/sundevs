import 'package:flutter/material.dart';
import 'package:sundevs/widget/custom_appbar.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  static const String routeName = '/wating';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WaitingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
