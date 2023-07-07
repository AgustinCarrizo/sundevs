part of 'comics_bloc.dart';

class ComicState extends Equatable {
  const ComicState();

  @override
  List<Object?> get props => [];
}

class ComicLoading extends ComicState {}

class ComicLoaded extends ComicState {
  final List<Comic>? comic;
  final bool list;

  const ComicLoaded({this.comic, this.list = true});

  @override
  List<Object?> get props => [comic, list];
}

