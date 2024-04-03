import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';

import '../../../domain/models/article.dart';
import '../../../injectable.dart';
import '../../cubits/remote_articles/remote_articles_cubit.dart';
import '../../cubits/remote_articles/remote_articles_state.dart';
import '../../widgets/indicator_adaptive_widget.dart';
import '../info/info_content.dart';
import 'federation_single_item.dart';

class FederationListPage extends StatelessWidget {
  const FederationListPage({super.key});

  @override
  Widget build(BuildContext context) => getFederationMember(context);

  getFederationMember(BuildContext context) {
    return BlocConsumer<RemoteArticlesCubit, RemoteArticlesState>(
        bloc: getIt<RemoteArticlesCubit>()..getBreakingNewsArticles(context),
        listener: (_, state) {},
        builder: (_, state) {
          return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const PlatformLoadingIndicatorWidget(),
              success: (List<Article> articles) =>
                  _buildFederation(context, articles),
              error: (String error) => Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (10 % 9)],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      error,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: context.headerLine3Context,
                    ),
                  ));
          // const Center(child: Icon(Ionicons.refresh)));
        });
  }

  Widget _buildFederation(BuildContext context, List<Article> articles) {
    return Scaffold(
        body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int position) {
              return FederationSingleItem(article: articles[position]);
            }));
  }
}
