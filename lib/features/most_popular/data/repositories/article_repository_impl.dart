import 'package:dartz/dartz.dart';
import 'package:ny_times/core/error/failure.dart';
import 'package:ny_times/core/utils/enums.dart';

import '../../../../core/service_locator.dart';
import '../../domain/entities/response_entity.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/remote/article_remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<Either<Failure, ResponseEntity>> getMostArticles(
      MostOption option, Period period) async {
    final articleRemoteDataSource = serviceLocator<ArticleRemoteDataSource>();
    return await articleRemoteDataSource.getMostArticles(option, period);
  }
}
