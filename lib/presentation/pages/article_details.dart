import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';
import 'package:flutter_news/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleEntity article;
  final int index;

  const ArticleDetailsPage({
    super.key,
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${article.title}",
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "article_image ${index.toString()}",
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.black12,
                  height: 100,
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "${article.title}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${article.author}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          "${article.publishedAt}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: const Text(
                        "Open article in browser",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                      onTap: () => launchUrl(Uri.parse(article.url!)),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "${article.description}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${article.content}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 36),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      if (state.articles.contains(article)) {
                        return ElevatedButton(
                          onPressed: () {
                            context
                                .read<FavoriteBloc>()
                                .add(RemoveFromFavorite(article: article));
                          },
                          child: const Text("Remove from favorite"),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            context
                                .read<FavoriteBloc>()
                                .add(AddToFavorite(article: article));
                          },
                          child: const Text("Add to favorite"),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
