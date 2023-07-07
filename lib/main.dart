import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundevs/repositories/repositories.dart';
import '/blocs/blocs.dart';
import 'config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: const MaterialApp(
        title: 'ComicBook',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
