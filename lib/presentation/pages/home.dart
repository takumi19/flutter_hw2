import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/presentation/bloc/article/article_bloc.dart';
import 'package:flutter_news/presentation/widgets/article_tile.dart';
import 'package:flutter_news/presentation/widgets/bottom_tab_bar.dart';
import 'package:flutter_news/presentation/widgets/theme_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter news app"),
        actions: const [ThemeSwitch()],
        scrolledUnderElevation: 0,
      ),
      bottomNavigationBar: const BottomTabBar(),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (_, state) {
          if (state is ArticlesLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is ArticlesError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }

          if (state is ArticlesDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleTile(
                  article: state.articles![index],
                  index: index,
                );
              },
              itemCount: state.articles!.length,
              physics: const AlwaysScrollableScrollPhysics(),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
