import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ny_times/core/error/failure.dart';
import 'package:ny_times/core/utils/constants.dart';
import 'package:ny_times/core/utils/enums.dart';
import 'package:ny_times/core/utils/utils.dart';
import 'package:ny_times/features/most_popular/domain/entities/response_entity.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRemoteDataSource {
  Future<Either<Failure, ResponseEntity>> getMostArticles(
      MostOption option, Period period);
}

class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource {
  @override
  Future<Either<Failure, ResponseEntity>> getMostArticles(
      MostOption option, Period period) async {
    String optionString = Utils.fromMostOption(option);
    int periodInt = Utils.fromPeriod(period);
    Uri uri = Uri(
      scheme: 'https',
      host: 'api.nytimes.com',
      path: 'svc/mostpopular/v2/$optionString/$periodInt.json',
      queryParameters: {'api-key': nytKey},
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final responseEntity =
            ResponseEntity.fromJson(jsonDecode(response.body));
        return Right(responseEntity);
      } else {
        return Left(ConnectionFailure(response.body));
      }
    } catch (e) {
      return const Left(ParsingFailure('Connection Error'));
    }
  }
}
