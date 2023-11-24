import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

part 'local_articles_state.freezed.dart';

@freezed
class LocalArticlesState with _$LocalArticlesState {
  const factory LocalArticlesState.initial() = _Initial;

  const factory LocalArticlesState.loading() = _Loading;

  const factory LocalArticlesState.success(List<Article> articles) = _Success;

  const factory LocalArticlesState.error(String error) = _Error;
}
