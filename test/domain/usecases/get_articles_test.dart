import "package:flutter_news/core/data_state.dart";
import "package:flutter_news/domain/entities/article_entity.dart";
import "package:flutter_news/domain/usecases/get_articles.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";

import "../../helpers/test_helper.mocks.dart";

void main() {
  late GetArticlesUseCase getArticlesUseCase;
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    getArticlesUseCase =
        GetArticlesUseCase(articleRepository: mockArticleRepository);
  });

  const testArticleEntity = ArticleEntity(
    author: "Someone",
    content: "Large content as if it was a real article",
    description: "Some description for article",
    id: 99999,
    publishedAt: "Today maybe",
    title: "Shock! That is the first test to this app in my entire life!",
    url: "http://some-article.net",
    urlToImage: "http://some-article.net/some-image",
  );

  test("shoud get current articles from the repository", () async {
    when(mockArticleRepository.getArticles()).thenAnswer(
      (_) async => Future(
        () => const DataSuccess([testArticleEntity]),
      ),
    );

    final result = await getArticlesUseCase.call();

    expect(result, const DataSuccess([testArticleEntity]));
  });
}
