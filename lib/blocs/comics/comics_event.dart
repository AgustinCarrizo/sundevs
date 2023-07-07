part of 'comics_bloc.dart';

abstract class ComicEvent extends Equatable {
  const ComicEvent();

  @override
  List<Object> get props => [];
}

class LoadComic extends ComicEvent {}

class FormatView extends ComicEvent {
  final bool list;

  const FormatView(this.list);

  @override
  List<Object> get props => [list];
}

