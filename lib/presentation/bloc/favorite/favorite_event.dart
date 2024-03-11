// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'favorite_bloc.dart';


sealed class FavoriteEvent extends Equatable {

  const FavoriteEvent();


  @override

  List<Object> get props => [];

}


class AddToFavorite extends FavoriteEvent {

  final ArticleEntity article;


  const AddToFavorite({

    required this.article,

  });

}


class RemoveFromFavorite extends FavoriteEvent {

  final ArticleEntity article;


  const RemoveFromFavorite({

    required this.article,

  });

}

