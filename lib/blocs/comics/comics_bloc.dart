
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundevs/repositories/repositories.dart';
import '/models/models.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final ComicsRepository _comicsRepository;

  ComicBloc({required ComicsRepository comicsRepository})
      : _comicsRepository = comicsRepository,
        super(ComicLoading()) {
    on<LoadComic>(_onLoadComic);
    on<FormatView>(_onFormartView);
  }

  void _onLoadComic(
    LoadComic event,
    Emitter<ComicState> emit,
  ) async {
    var response = await _comicsRepository.getAllComics();

    emit(ComicLoaded(comic: response.results));
  }

  void _onFormartView(
    FormatView event,
    Emitter<ComicState> emit,
  ) async {
    if (state is ComicLoaded) {
      final state = this.state as ComicLoaded;
      emit(ComicLoaded(comic: state.comic, list: event.list));
    }
  }
}
