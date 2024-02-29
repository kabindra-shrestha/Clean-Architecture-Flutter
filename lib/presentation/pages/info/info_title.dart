import 'package:flutter/material.dart';
import 'package:sample_clean_architecture/core/extensions/context_extension.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

class InfoTitle extends StatelessWidget {
  final Article article;

  const InfoTitle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              article.author!,
              style: context.headerLine5Context,
            ),
            const SizedBox(
              width: 8,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
                const Icon(Icons.verified, color: Colors.blue),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          article.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.headerLine5Context,
        ),
      ],
    );
  }
}
