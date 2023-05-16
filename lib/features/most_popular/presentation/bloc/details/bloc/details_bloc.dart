import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/most_popular/domain/entities/article_entity.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsSelectEvent>((event, emit) {
      emit(DetailsSelected(event.article));
    });
  }
}
