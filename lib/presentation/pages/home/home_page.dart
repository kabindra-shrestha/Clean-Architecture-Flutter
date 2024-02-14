import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';

import '../../../domain/models/article.dart';
import '../../../injectable.dart';
import '../../cubits/local_articles/local_articles_cubit.dart';
import '../../cubits/local_articles/local_articles_state.dart';
import '../../cubits/remote_articles/remote_articles_cubit.dart';
import '../../cubits/remote_articles/remote_articles_state.dart';
import '../../widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => getArticles(context, true);

  getArticles(BuildContext context, bool fromRemote) {
    if (fromRemote) {
      return BlocConsumer<RemoteArticlesCubit, RemoteArticlesState>(
          bloc: getIt<RemoteArticlesCubit>()..getBreakingNewsArticles(context),
          listener: (_, state) {},
          builder: (_, state) {
            return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const PlatformLoadingIndicatorWidget(),
                success: (List<Article> articles) =>
                    _buildArticles(context, articles),
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
                        style: context.subTitle1Context,
                      ),
                    ));
            // const Center(child: Icon(Ionicons.refresh)));
          });
    } else {
      return BlocConsumer<LocalArticlesCubit, LocalArticlesState>(
          bloc: getIt<LocalArticlesCubit>()..getAllSavedArticles(),
          listener: (_, state) {},
          builder: (_, state) {
            return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const PlatformLoadingIndicatorWidget(),
                success: (List<Article> articles) =>
                    _buildArticles(context, articles),
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
                        style: context.subTitle1Context,
                      ),
                    ));
            // const Center(child: Icon(Ionicons.refresh)));
          });
    }
  }

  Widget _buildArticles(
    BuildContext context,
    List<Article> articles,
  ) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: SafeArea(
            child: FlexibleSpaceBar(
              title: Text(
                'Articles',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        SliverToBoxAdapter(
          child: CarouselSlider(
            options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true),
            items: articles
                .sublist(0, 5)
                .map((item) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(item.urlToImage!,
                                  fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    '${item.title}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.subTitle1Context,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ))
                .toList(),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('Item $index clicked');
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text(
                    articles[index].title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.subTitle1Context,
                  ),
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
              return GestureDetector(
                onTap: () {
                  print('Item $index clicked');
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text(
                    articles[index].title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.subTitle1Context,
                  ),
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
