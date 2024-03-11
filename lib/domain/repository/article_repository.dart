import 'package:flutter_news/core/data_state.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
