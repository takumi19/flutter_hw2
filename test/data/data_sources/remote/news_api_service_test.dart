import 'package:dio/dio.dart';
import 'package:flutter_news/core/constants.dart';
import 'package:flutter_news/core/data_state.dart';
import 'package:flutter_news/data/repository/article_repository_impl.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import '../../../dummy/dummy_articles.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockNewsApiService mockNewsApiService;
  late ArticleRepositoryImpl articleRepositoryImpl;

  setUp(() {
    mockNewsApiService = MockNewsApiService();
    articleRepositoryImpl =
        ArticleRepositoryImpl(newsApiService: mockNewsApiService);
  });

  group('get current articles', () {
    test('should return DataSuccess when the response code is 200', () async {
      when(mockNewsApiService.getArticles(
        apiKey: apiKey,
        category: category,
        country: country,
      )).thenAnswer(
        (_) async => Future(
          () => HttpResponse(
            dummyArticles,
            Response(requestOptions: RequestOptions(), statusCode: 200),
          ),
        ),
      );

      final result = await articleRepositoryImpl.getArticles();

      expect(result, isA<DataSuccess<List<ArticleEntity>>>());
    });

    test('should return DataFailed when the response code is 404 or other',
        () async {
      when(mockNewsApiService.getArticles(
        apiKey: apiKey,
        category: category,
        country: country,
      )).thenAnswer(
        (_) async => Future(
          () => HttpResponse(
            dummyArticles,
            Response(requestOptions: RequestOptions(), statusCode: 404),
          ),
        ),
      );

      final result = await articleRepositoryImpl.getArticles();

      expect(result, isA<DataFailed<List<ArticleEntity>>>());
    });
  });
}
