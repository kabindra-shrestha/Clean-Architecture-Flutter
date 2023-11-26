import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_clean_architecture/injectable.dart';
import 'package:sample_clean_architecture/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:sample_clean_architecture/presentation/cubits/local_articles/local_articles_state.dart';
import 'package:sample_clean_architecture/presentation/cubits/remote_articles/remote_articles_state.dart';

import '../../../core/resources/data_state.dart';
import '../../../domain/models/requests/breaking_news.request.dart';
import '../../../domain/repositories/api_repository.dart';

@injectable
class RemoteArticlesCubit extends Cubit<RemoteArticlesState> {
  final ApiRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesState.initial());

  int _page = 1;

  Future<void> getBreakingNewsArticles(BuildContext context) async {
    final localArticlesCubit = BlocProvider.of<LocalArticlesCubit>(context);

    emit(const RemoteArticlesState.initial());
    emit(const RemoteArticlesState.loading());

    final response = await _apiRepository.getBreakingNewsArticles(
      request: BreakingNewsRequest(page: _page),
    );

    if (response is DataSuccess) {
      final articles = response.data!.articles;

      localArticlesCubit.saveArticles(articles: articles);

      emit(RemoteArticlesState.success(articles));
    } else if (response is DataFailed) {
      emit(RemoteArticlesState.error(response.error!.message!));
    }
  }
}
