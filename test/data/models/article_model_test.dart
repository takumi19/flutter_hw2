import "package:flutter_news/data/models/article_model.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  const testArticleModel = ArticleModel(
    author: "Some good person",
    content: "Large article content #2",
    description: "And lets pretend that I have never write this before",
    id: 88888,
    publishedAt: "Yesterday",
    title: "Another garbage title. Who send you to create this titles?",
    url: "http://some-url-2.net",
    urlToImage: "http://some-url-2.net/some-image-2",
  );

  test("shoud be an article model", () async {
    expect(testArticleModel, isA<ArticleModel>());
  });
}
