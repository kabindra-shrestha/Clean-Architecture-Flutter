import 'package:flutter/material.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

class InfoContent extends StatelessWidget {
  final Article article;

  const InfoContent({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          article.title!,
          style: context.headerLine6Context,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          article.content!,
          style: context.headerLine6Context,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          article.description!,
          style: context.headerLine6Context,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          article.toString(),
          style: context.headerLine6Context,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
