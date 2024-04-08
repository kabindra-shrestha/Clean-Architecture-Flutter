import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/article.dart';

class FederationSingleItem extends StatelessWidget {
  final Article article;
  const FederationSingleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body : Column(children: <Widget>[
      Text('Deliver features faster'),
      Text('Craft beautiful UIs'),
      Expanded(
        child: FittedBox(
          child: FlutterLogo(),
        ),
      ),
    ]));
  }
}
