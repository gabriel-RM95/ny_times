part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsSelected extends DetailsState {
  final ArticleEntity article;

  const DetailsSelected(this.article);

  @override
  List<Object> get props => [article];
}
