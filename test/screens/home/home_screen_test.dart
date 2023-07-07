import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sundevs/blocs/blocs.dart';
import 'package:sundevs/models/models.dart';
import 'package:sundevs/screens/home/home_screen.dart';
import 'package:mockito/annotations.dart';

import '../../mock/mockcomicjson.dart';
import 'home_screen_test.mocks.dart';

class MockComicBloc extends MockBloc<ComicEvent, ComicState>
    implements ComicBloc {}

@GenerateMocks([MockComicBloc])
void main() {
  group('home', () {
    late Comics parsedData;

    setUp(() async {
      parsedData = Comics.fromJson(Mockcomicjson().json);
    });

    testWidgets(
      'renders with expected widgets',
      (WidgetTester tester) async {
        final mockComicBloc = MockMockComicBloc();

        final comicState = ComicLoaded(
          comic: parsedData.results,
          list: false,
        );

        final updatedComicState = ComicLoaded(
          comic: parsedData.results,
          list: true,
        );

        when(mockComicBloc.state).thenReturn(comicState);

        when(mockComicBloc.stream).thenAnswer(
          (_) => Stream.fromIterable([comicState]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<ComicBloc>.value(
                value: mockComicBloc,
                child: const HomeScreen(),
              ),
            ),
          ),
        );

        expect(find.text('Latest Issues'), findsOneWidget);
        expect(find.text('List'), findsOneWidget);
        expect(find.text('Grid'), findsOneWidget);
        expect(find.byType(GridView), findsOneWidget);
        expect(find.byType(ListView), findsNothing);

        await tester.tap(find.text('List'));

        when(mockComicBloc.add(any)).thenAnswer((_) {
          mockComicBloc.emit(updatedComicState);
        });

        await tester.pump();

        expect(find.byType(ListView), findsNothing);
        expect(find.byType(GridView), findsOneWidget);
      },
    );
  });
}
