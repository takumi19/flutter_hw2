import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/core/data_state.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_news/domain/usecases/get_articles.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticleBloc({required this.getArticlesUseCase})
      : super(const ArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticleState> emit) async {
    final dataState = await getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ArticlesError(dataState.error!));
    }
  }
}
