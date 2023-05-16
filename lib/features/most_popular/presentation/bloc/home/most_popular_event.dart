part of 'most_popular_bloc.dart';

abstract class MostPopularEvent extends Equatable {
  const MostPopularEvent();

  @override
  List<Object> get props => [];
}

class MostPopularSubmitEvent extends MostPopularEvent {
  final MostOption option;
  final Period period;

  const MostPopularSubmitEvent(this.option, this.period);

  @override
  List<Object> get props => [option, period];
}
