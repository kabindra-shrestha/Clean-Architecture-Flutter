import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_clean_architecture/presentation/cubits/local_articles/local_articles_state.dart';

import '../../../domain/models/article.dart';
import '../../../domain/repositories/database_repository.dart';

@injectable
class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository)
      : super(const LocalArticlesState.initial());

  Future<void> getAllSavedArticles() async {
    emit(const LocalArticlesState.initial());
    emit(const LocalArticlesState.loading());

    emit(await _getAllSavedArticles());
  }

  Future<void> removeArticle({required Article article}) async {
    emit(const LocalArticlesState.initial());
    emit(const LocalArticlesState.loading());

    await _databaseRepository.removeArticle(article);
    // emit(await _getAllSavedArticles());
  }

  Future<void> saveArticles({required List<Article> articles}) async {
    emit(const LocalArticlesState.initial());
    emit(const LocalArticlesState.loading());

    await _databaseRepository.saveArticles(articles);
    // emit(await _getAllSavedArticles());
  }

  Future<LocalArticlesState> _getAllSavedArticles() async {
    final articles = await _databaseRepository.getSavedArticles();
    return LocalArticlesState.success(articles);
  }
}
