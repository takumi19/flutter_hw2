import 'package:dio/dio.dart';
import 'package:flutter_news/core/constants.dart';
import 'package:flutter_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part "news_api_service.g.dart";

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
