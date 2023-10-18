import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

      ///SETTINGS
      GoRoute(
          name: 'settings',
          path: RouterPath.settings,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsPage();
          }),
    ]);
