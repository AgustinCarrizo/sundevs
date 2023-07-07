part of 'comicdetail_bloc.dart';

abstract class ComicDetailState extends Equatable {
  const ComicDetailState();

  @override
  List<Object?> get props => [];
}

class ComicDetailLoading extends ComicDetailState {}

class ComicDetailLoaded extends ComicDetailState {
  final ImagenComic? comic;

  const ComicDetailLoaded({
    this.comic,
  });

  @override
  List<Object?> get props => [comic];
}
