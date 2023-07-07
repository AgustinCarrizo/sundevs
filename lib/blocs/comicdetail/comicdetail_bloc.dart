import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundevs/repositories/repositories.dart';
import '/models/models.dart';

part 'comicdetail_event.dart';
part 'comicdetail_state.dart';

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicDetailState> {
  final ComicDetailRepository _comicsRepository;

  ComicDetailBloc({required ComicDetailRepository comicsRepository})
      : _comicsRepository = comicsRepository,
        super(ComicDetailLoading()) {
    on<LoadComicDetail>(_onLoadComic);
  }

  void _onLoadComic(
    LoadComicDetail event,
    Emitter<ComicDetailState> emit,
  ) async {
    emit(ComicDetailLoading());
    var response = await _comicsRepository.getComicDetail(event.url);
    
    emit(ComicDetailLoaded(comic: response));
  }
}
