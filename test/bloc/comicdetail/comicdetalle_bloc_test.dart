import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sundevs/blocs/comicdetail/comicdetail_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:sundevs/models/models.dart';
import 'package:sundevs/repositories/repositories.dart';

import '../../mock/mockcomicdetailjson.dart';
import 'comicdetalle_bloc_test.mocks.dart';

class MockComicDetailRepository extends Mock implements ComicDetailRepository {}

@GenerateMocks([MockComicDetailRepository])
void main() {
  group('ComicDetailBloc', () {
    late ComicDetailBloc comicDetailBloc;
    final mockComicDetailRepository = MockMockComicDetailRepository();
    late ImagenComic parsedData;
    setUp(() {
      comicDetailBloc =
          ComicDetailBloc(comicsRepository: mockComicDetailRepository);

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

    tearDown(() {
      comicDetailBloc.close();
    });

    const url = '';

    blocTest<ComicDetailBloc, ComicDetailState>(
      'LoadComicDetail event is added',
      build: () => comicDetailBloc,
      act: (bloc) => bloc.add(const LoadComicDetail(url)),
      setUp: () {
        when(mockComicDetailRepository.getComicDetail(url)).thenAnswer(
          (_) async => parsedData,
        );
      },
      seed: () => ComicDetailLoading(),
      expect: () => [
        ComicDetailLoaded(comic: parsedData),
      ],
      verify: (_) {
        verify(mockComicDetailRepository.getComicDetail(url)).called(1);
      },
    );
  });
}
