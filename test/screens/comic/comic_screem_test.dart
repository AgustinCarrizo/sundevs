import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sundevs/blocs/blocs.dart';
import 'package:sundevs/models/models.dart';
import 'package:mockito/annotations.dart';
import 'package:sundevs/screens/screens.dart';

import '../../mock/mockcomicdetailjson.dart';

import 'comic_screem_test.mocks.dart';

class MockComicDetailBloc extends MockBloc<ComicDetailEvent, ComicDetailState>
    implements ComicDetailBloc {}

@GenerateMocks([MockComicDetailBloc])
void main() {
  group('home', () {
    late ImagenComic parsedData;

    setUp(() async {
      var parsedata =
          ComicDetail.fromJson(MockComicDetailjson().jsonComicDetail);
      var pasedataImg = ImagenDetail.fromJson(MockComicDetailjson().jsonImagen);

      List<Imagen> listImagen = [pasedataImg.results ?? Imagen()];

      parsedData = ImagenComic(
        detail: parsedata.results,
        chacarter: listImagen,
        credits: listImagen,
        location: listImagen,
      );
    });

    testWidgets(
      'renders with expected widgets',
      (WidgetTester tester) async {
        final mockComicBloc = MockMockComicDetailBloc();

        final comicState = ComicDetailLoading();

        final updatedComicState = ComicDetailLoaded(
          comic: parsedData,
        );

        when(mockComicBloc.state).thenReturn(comicState);
        when(mockComicBloc.state).thenReturn(updatedComicState);
        when(mockComicBloc.stream).thenAnswer(
          (_) => Stream.fromIterable([comicState]),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<ComicDetailBloc>.value(
                value: mockComicBloc,
                child: const ComicScreen(),
              ),
            ),
          ),
        );

        expect(find.byType(CachedNetworkImage), findsWidgets);
        expect(find.byType(BuildGridView), findsNWidgets(3));
      },
    );
  });
}
