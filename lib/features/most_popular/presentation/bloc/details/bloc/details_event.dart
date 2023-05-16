part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsSelectEvent extends DetailsEvent {
  final ArticleEntity article;

  const DetailsSelectEvent(this.article);

  @override
  List<Object> get props => [article];
}
