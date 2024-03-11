import 'package:flutter_news/config/usecase.dart';
import 'package:flutter_news/core/data_state.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_news/domain/repository/article_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository articleRepository;

  const GetArticlesUseCase({required this.articleRepository});

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getArticles();
  }
}
