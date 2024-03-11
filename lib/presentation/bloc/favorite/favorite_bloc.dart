import 'package:equatable/equatable.dart';

import 'package:flutter_news/domain/entities/article_entity.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';


part 'favorite_event.dart';

part 'favorite_state.dart';


class FavoriteBloc extends HydratedBloc<FavoriteEvent, FavoriteState> {

  FavoriteBloc() : super(const FavoriteInitial(articles: [])) {

    on<AddToFavorite>((event, emit) {

      final state = this.state;


      final article = event.article;


      List<ArticleEntity> allArticles = List.from(state.articles)..add(article);


      var set = <String>{};


      emit(

        FavoriteState(

          articles: allArticles.where((item) => set.add(item.title!)).toList(),

        ),

      );

    });


    on<RemoveFromFavorite>((event, emit) {

      final state = this.state;


      final article = event.article;


      List<ArticleEntity> allArticles = List.from(state.articles)

        ..remove(article);


      var set = <String>{};


      emit(

        FavoriteState(

          articles: allArticles.where((item) => set.add(item.title!)).toList(),

        ),

      );

    });

  }


  @override

  FavoriteState? fromJson(Map<String, dynamic> json) {

    return FavoriteState.fromMap(json);

  }


  @override

  Map<String, dynamic>? toJson(FavoriteState state) {

    return state.toMap();

  }

}

