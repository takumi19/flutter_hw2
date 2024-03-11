part of 'article_bloc.dart';

sealed class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const ArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class ArticlesLoading extends ArticleState {
  const ArticlesLoading();
}

class ArticlesDone extends ArticleState {
  const ArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class ArticlesError extends ArticleState {
  const ArticlesError(DioException error) : super(error: error);
}
