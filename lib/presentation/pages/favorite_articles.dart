import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_news/presentation/widgets/article_tile.dart';
import 'package:flutter_news/presentation/widgets/bottom_tab_bar.dart';
import 'package:flutter_news/presentation/widgets/theme_switch.dart';

class FavoriteArticlesPage extends StatelessWidget {
  const FavoriteArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Favorite articles page"),
            actions: const [ThemeSwitch()],
            scrolledUnderElevation: 0,
          ),
          bottomNavigationBar: const BottomTabBar(),
          body: state.articles.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return ArticleTile(
                      article: state.articles[index],
                      index: index,
                    );
                  },
                  itemCount: state.articles.length,
                )
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Your favorite list is empty",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
        );
      },
    );
  }
}
