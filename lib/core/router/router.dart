import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_clean_architecture/domain/models/article.dart';

import '../../presentation/pages/pages.dart';
import 'router_path.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// The route configuration.
final goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    //navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: 'splash',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashPage();
          }),

      ///HOME
      GoRoute(
          name: 'home',
          path: RouterPath.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          }),

      ///INFO
      GoRoute(
          name: 'info',
          path: RouterPath.info,
          builder: (BuildContext context, GoRouterState state) {
            return InfoPage(article: state.extra as Article);
          }),

      ///SETTINGS
      GoRoute(
          name: 'settings',
          path: RouterPath.settings,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsPage();
          }),

      ///FEDERATION
      GoRoute(
          name: 'federation',
          path: RouterPath.federation,
          builder: (BuildContext context, GoRouterState state) {
            return const FederationListPage();
          }),
    ]);

