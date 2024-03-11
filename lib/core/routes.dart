// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_news/presentation/pages/article_details.dart';
import 'package:flutter_news/presentation/pages/favorite_articles.dart';
import 'package:flutter_news/presentation/pages/home.dart';

class Routes {
  static const home = "/";
  static const details = "/details";
  static const favorite = "/favorite";
}

class ArticleDetailsArgs {
  final ArticleEntity article;
  final int index;

  ArticleDetailsArgs({
    required this.article,
    required this.index,
  });
}

List<String> tabs = [Routes.home, Routes.favorite];

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case Routes.details:
        if (args is ArticleDetailsArgs) {
          return MaterialPageRoute(
            builder: (_) => ArticleDetailsPage(
              article: args.article,
              index: args.index,
            ),
            settings: settings,
          );
        }

      case Routes.favorite:
        return MaterialPageRoute(
          builder: (_) => const FavoriteArticlesPage(),
          settings: settings,
        );
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error!"),
        ),
      ),
      settings: settings,
    );
  }
}
