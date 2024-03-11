import "package:dio/dio.dart";
import "package:flutter_news/data/data_sources/remote/news_api_service.dart";
import "package:flutter_news/domain/repository/article_repository.dart";
import "package:mockito/annotations.dart";

@GenerateMocks(
  [ArticleRepository],
  customMocks: [
    MockSpec<Dio>(as: #MockDio),
    MockSpec<NewsApiService>(as: #MockNewsApiService),
  ],
)
void main() {}
