import 'package:floor/floor.dart';

import '../../../../core/constants/constants.dart';
import '../../../../domain/models/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticles(List<Article> articles);

  @delete
  Future<void> deleteArticle(Article article);
}
