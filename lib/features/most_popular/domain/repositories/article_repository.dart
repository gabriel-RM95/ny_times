import 'package:dartz/dartz.dart';
import 'package:ny_times/core/error/failure.dart';
import 'package:ny_times/core/utils/enums.dart';
import 'package:ny_times/features/most_popular/domain/entities/response_entity.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ResponseEntity>> getMostArticles(
      MostOption option, Period period);
}
