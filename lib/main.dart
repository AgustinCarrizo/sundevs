import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sundevs/dio/connectionprovider.dart';
import 'package:sundevs/repositories/repositories.dart';
import 'package:sundevs/screens/screens.dart';
import 'package:sundevs/utils/variable_static.dart';
import '/blocs/blocs.dart';
import 'config/app_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConnectivityProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, connectivityProvider, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ComicBloc(
                comicsRepository: ComicsRepository(),
              )..add(LoadComic()),
            ),
            BlocProvider(
              create: (_) => ComicDetailBloc(
                comicsRepository: ComicDetailRepository(),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'ComicBook',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            scaffoldMessengerKey: NavigationService.navigatorKey,
            home: connectivityProvider.hasInternetConnection
                ? const HomeScreen()
                : const WaitingScreen(),
          ),
        );
      },
    );
  }
}
