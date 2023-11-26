import '../models/article.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getSavedArticles();

  Future<void> saveArticles(List<Article> article);

  Future<void> removeArticle(Article article);
}
