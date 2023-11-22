import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

part 'remote_articles_state.freezed.dart';

@freezed
class RemoteArticlesState with _$RemoteArticlesState {
  const factory RemoteArticlesState.initial() = _Initial;

  const factory RemoteArticlesState.loading() = _Loading;

  const factory RemoteArticlesState.success(List<Article> articles) = _Success;

  const factory RemoteArticlesState.error(String error) = _Error;
}
