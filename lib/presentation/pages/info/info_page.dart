import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

import 'info_content.dart';
import 'info_title.dart';

const expandedHeight = 240.0;

class InfoPage extends StatefulWidget {
  final Article article;

  const InfoPage({super.key, required this.article});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _controller = ScrollController();
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(moveOffset);
  }

  moveOffset() {
    setState(() {
      _offset = min(max(0, _controller.offset / 6 - 16), 32);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(moveOffset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: expandedHeight,
          collapsedHeight: 90,
          stretch: true,
          snap: true,
          floating: true,
          pinned: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                widget.article.urlToImage!,
                fit: BoxFit.cover,
              ),
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.all(24),
              title: InfoTitle(article: widget.article),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: InfoContent(article: widget.article),
        ),
      ],
    ));
  }
}
