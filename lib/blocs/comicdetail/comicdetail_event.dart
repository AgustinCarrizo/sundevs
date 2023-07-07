part of 'comicdetail_bloc.dart';

abstract class ComicDetailEvent extends Equatable {
  const ComicDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadComicDetail extends ComicDetailEvent {
  final String? url;

  const LoadComicDetail(this.url);

  @override
  List<Object> get props => [];
}


