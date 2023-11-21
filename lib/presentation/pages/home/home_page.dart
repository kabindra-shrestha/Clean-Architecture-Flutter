import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';

import '../../../domain/models/article.dart';
import '../../../injectable.dart';
import '../../cubits/remote_articles/remote_articles_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<RemoteArticlesCubit, RemoteArticlesState>(
          bloc: getIt<RemoteArticlesCubit>()..getBreakingNewsArticles(),
          listener: (_, state) {},
          builder: (_, state) {
            print("state.runtimeType: ${state.runtimeType}");
            switch (state.runtimeType) {
              case RemoteArticlesLoading _:
                return const CupertinoActivityIndicator(
                    color: Colors.blueAccent);
              case RemoteArticlesFailed _:
                return const Center(child: Icon(Ionicons.refresh));
              case RemoteArticlesSuccess _:
                return _buildArticles(state.articles);
              default:
                return _buildArticles(state.articles);
            }
          });

  Widget _buildArticles(
    List<Article> articles,
  ) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Articles',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text(
                  articles[index].title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.subTitle1Context,
                ),
              );
            },
            childCount: articles.length,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text(
                  articles[index].title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.subTitle1Context,
                ),
              );
            },
            childCount: articles.length,
          ),
        ),
      ],
    );
  }
}
