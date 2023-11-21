import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/nums.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/article.dart';
import '../../../domain/models/requests/breaking_news.request.dart';
import '../../../domain/repositories/api_repository.dart';
import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

@injectable
class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;

    await run(() async {
      Future.delayed(const Duration(seconds: 5), () async {
        final response = await _apiRepository.getBreakingNewsArticles(
          request: BreakingNewsRequest(page: _page),
        );

        if (response is DataSuccess) {
          final articles = response.data!.articles;
          final noMoreData = articles.length < defaultPageSize;

          data.addAll(articles);
          _page++;

          emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
        } else if (response is DataFailed) {
          emit(RemoteArticlesFailed(error: response.error));
        }
      });
    });
  }
}
