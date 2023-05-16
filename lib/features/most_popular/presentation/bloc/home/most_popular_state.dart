part of 'most_popular_bloc.dart';

abstract class MostPopularState extends Equatable {
  const MostPopularState();

  @override
  List<Object> get props => [];
}

// class MostPopularInitial extends MostPopularState {}

class MostPopularLoading extends MostPopularState {}

class MostPopularFailure extends MostPopularState {
  final String error;

  const MostPopularFailure(this.error);

  @override
  List<Object> get props => [error];
}

class MostPopularLoaded extends MostPopularState {
  final ResponseEntity responseEntity;

  const MostPopularLoaded(this.responseEntity);

  @override
  List<Object> get props => [responseEntity];
}
