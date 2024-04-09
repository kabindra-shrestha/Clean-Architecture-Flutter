import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';

import '../../../core/router/router_path.dart';
import '../../../domain/models/article.dart';

class FederationSingleItem extends StatelessWidget {
  final Article article;

  const FederationSingleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        context.push(RouterPath.info, extra: article);
      },
      child: Row(
        children: <Widget>[
          Center(
            child: Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              child: Image.network(
                article.urlToImage!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.author!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: context.headerLine3Context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
