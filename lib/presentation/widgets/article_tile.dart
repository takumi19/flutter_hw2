import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/core/routes.dart';
import 'package:flutter_news/domain/entities/article_entity.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  final int index;

  const ArticleTile({
    super.key,
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.details,
          arguments: ArticleDetailsArgs(
            article: article,
            index: index,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Hero(
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
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${article.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${article.description}",
                    maxLines: 2,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${article.publishedAt}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
