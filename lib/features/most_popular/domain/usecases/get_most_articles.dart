import 'package:dartz/dartz.dart';
import 'package:ny_times/core/utils/enums.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/service_locator.dart';
import '../entities/response_entity.dart';
import '../repositories/article_repository.dart';

class GetMostArticlesUsecase {
  Future<Either<Failure, ResponseEntity>> getMostArticles(
      MostOption option, Period period) async {
    final articleRepository = serviceLocator<ArticleRepository>();
    return await articleRepository.getMostArticles(option, period);
  }
}
