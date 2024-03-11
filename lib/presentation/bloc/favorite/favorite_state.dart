part of 'favorite_bloc.dart';


class FavoriteState extends Equatable {

  final List<ArticleEntity> articles;


  const FavoriteState({this.articles = const <ArticleEntity>[]});


  @override

  List<Object> get props => [articles];


  Map<String, dynamic> toMap() {

    return <String, dynamic>{

      'articles': articles.map((x) => x.toMap()).toList(),

    };

  }


  factory FavoriteState.fromMap(Map<String, dynamic> map) {

    return FavoriteState(

      articles: List<ArticleEntity>.from(
        map['articles']?.map<ArticleEntity>(

          (x) => ArticleEntity.fromMap(x as Map<String, dynamic>),

        ),

      ),

    );

  }

}


final class FavoriteInitial extends FavoriteState {

  const FavoriteInitial({required super.articles});

}

