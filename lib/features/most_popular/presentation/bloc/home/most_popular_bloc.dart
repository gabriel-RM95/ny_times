// import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/core/service_locator.dart';
import 'package:ny_times/core/utils/enums.dart';
import 'package:ny_times/features/most_popular/domain/entities/response_entity.dart';
import 'package:ny_times/features/most_popular/domain/usecases/get_most_articles.dart';

part 'most_popular_event.dart';
part 'most_popular_state.dart';

class MostPopularBloc extends Bloc<MostPopularEvent, MostPopularState> {
  MostPopularBloc() : super(MostPopularLoading()) {
    on<MostPopularSubmitEvent>((event, emit) async {
      emit(MostPopularLoading());
      final articlesUsecase = serviceLocator<GetMostArticlesUsecase>();
      final responseEntity =
          await articlesUsecase.getMostArticles(event.option, event.period);
      responseEntity.fold(
        (l) => emit(MostPopularFailure(l.message)),
        (r) => emit(MostPopularLoaded(r)),
      );
    });
  }
}
