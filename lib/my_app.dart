import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/routes.dart';
import 'package:flutter_news/core/themes.dart';
import 'package:flutter_news/injection_container.dart';
import 'package:flutter_news/presentation/bloc/article/article_bloc.dart';
import 'package:flutter_news/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_news/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_news/presentation/bloc/theme/theme_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(
          create: (context) => sl()..add(const GetArticles()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.switchValue == true ? darkTheme : lightTheme,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
          );
        },
      ),
    );
  }
}
