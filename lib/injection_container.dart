import "package:dio/dio.dart";
import "package:flutter_news/data/data_sources/remote/news_api_service.dart";
import "package:flutter_news/data/repository/article_repository_impl.dart";
import "package:flutter_news/domain/repository/article_repository.dart";
import "package:flutter_news/domain/usecases/get_articles.dart";
import "package:flutter_news/presentation/bloc/article/article_bloc.dart";
import "package:flutter_news/presentation/bloc/favorite/favorite_bloc.dart";
import "package:flutter_news/presentation/bloc/navigation/navigation_bloc.dart";
import "package:flutter_news/presentation/bloc/theme/theme_bloc.dart";
import "package:get_it/get_it.dart";

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(newsApiService: sl()),
  );

  sl.registerSingleton<GetArticlesUseCase>(
    GetArticlesUseCase(articleRepository: sl()),
  );

  sl.registerFactory<ArticleBloc>(
    () => ArticleBloc(getArticlesUseCase: sl()),
  );

  sl.registerFactory<NavigationBloc>(
    () => NavigationBloc(),
  );

  sl.registerFactory<ThemeBloc>(
    () => ThemeBloc(),
  );

  sl.registerFactory<FavoriteBloc>(
    () => FavoriteBloc(),
  );
}
