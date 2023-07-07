import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sundevs/blocs/blocs.dart';
import 'package:sundevs/models/models.dart';
import 'package:sundevs/repositories/repositories.dart';
import 'package:mockito/annotations.dart';


import '../../mock/mockcomicjson.dart';
import 'comic_bloc_test.mocks.dart';

class MockComicsRepository extends Mock implements ComicsRepository {}

@GenerateMocks([MockComicsRepository])
void main() {
  group('ComicBloc', () {
    late ComicsRepository mockComicsRepository;
    late Comics parsedData;
    setUp(() async {
      parsedData = Comics.fromJson(Mockcomicjson().json);
      mockComicsRepository = MockMockComicsRepository();
    });

    blocTest<ComicBloc, ComicState>(
      'LoadComic event is added',
      build: () => ComicBloc(comicsRepository: mockComicsRepository),
      act: (bloc) => bloc..add(LoadComic()),
      setUp: () {
        when(mockComicsRepository.getAllComics()).thenAnswer(
          (_) async => parsedData,
        );
      },
      expect: () => [
        ComicLoaded(comic: parsedData.results),
      ],
      verify: (_) {
        verify(mockComicsRepository.getAllComics()).called(1);
      },
    );

    blocTest<ComicBloc, ComicState>(
      'FormatView event is added',
      build: () => ComicBloc(comicsRepository: mockComicsRepository),
      act: (bloc) => bloc.add(const FormatView(true)),
      seed: () => ComicLoaded(comic: parsedData.results, list: false),
      expect: () => [
        ComicLoaded(comic: parsedData.results, list: true),
      ],
    );
    blocTest<ComicBloc, ComicState>(
      ' FormatView event is added revert',
      build: () => ComicBloc(comicsRepository: mockComicsRepository),
      act: (bloc) => bloc.add(const FormatView(false)),
      seed: () => ComicLoaded(comic: parsedData.results, list: true),
      expect: () => [
        ComicLoaded(comic: parsedData.results, list: false),
      ],
    );
  });
}
