import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/asset_image.dart';
import '../../../core/router/router_path.dart';
import '../../../injectable.dart';
import '../../cubits/splash/splash_cubits.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<SplashCubit, SplashState>(
      bloc: getIt<SplashCubit>()..isAuthenticatedUserCheck(),
      listener: (_, state) {
        ///when MUST BE ALL CUBIT STATE DEFINE AND whenOrNull NEED TO CUBIT STATE DEFINE
        state.whenOrNull(
            authenticate: () => context.go(RouterPath.home),
            unAuthenticatedState: () => context.go(RouterPath.settings));
      },
      builder: (_, state) => const Scaffold(
          body: Center(
              child: Image(
                  image: AssetImage(AssetImageConstant.applicationLogoImage))
              /*Text(Strings.of(context)!.appName,
                  style: context.headerLine6Context)*/
              )));
}
