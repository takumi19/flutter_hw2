import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_news/core/constants.dart';
import 'package:flutter_news/core/data_state.dart';
import 'package:flutter_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;

  const ArticleRepositoryImpl({required this.newsApiService});

  @override
  Future<DataState<List<ArticleEntity>>> getArticles() async {
    try {
      final response = await newsApiService.getArticles(
        apiKey: apiKey,
        category: category,
        country: country,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
          ),
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
