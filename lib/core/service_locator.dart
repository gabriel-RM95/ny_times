import 'package:get_it/get_it.dart';
import 'package:ny_times/features/most_popular/data/datasources/remote/article_remote_data_source.dart';
import 'package:ny_times/features/most_popular/data/repositories/article_repository_impl.dart';
import 'package:ny_times/features/most_popular/domain/repositories/article_repository.dart';
import 'package:ny_times/features/most_popular/domain/usecases/get_most_articles.dart';
import 'package:ny_times/features/most_popular/presentation/bloc/details/bloc/details_bloc.dart';

final serviceLocator = GetIt.instance;

void serviceLocatorInit() {
//Use Cases
  serviceLocator
      .registerFactory<GetMostArticlesUsecase>(() => GetMostArticlesUsecase());

//Repositories
  serviceLocator
      .registerFactory<ArticleRepository>(() => ArticleRepositoryImpl());

//Datasourses
  serviceLocator.registerFactory<ArticleRemoteDataSource>(
      () => ArticleRemoteDataSourceImpl());

//Blocs
  serviceLocator.registerSingleton<DetailsBloc>(DetailsBloc());
}
