import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformLoadingIndicatorWidget extends StatelessWidget {
  const PlatformLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
      child: RepaintBoundary(
          child: /*CircularProgressIndicator.adaptive()*/
              CupertinoActivityIndicator(color: Colors.redAccent)));
}
