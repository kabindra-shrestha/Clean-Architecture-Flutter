import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/localization/localization.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'injectable.dart';
import 'presentation/cubits/theme/theme_cubits.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  configure();

  // Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => getIt<ThemeCubit>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Builder(builder: (context) {
            return BlocBuilder<ThemeCubit, ThemeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (_, themeState) => MaterialApp.router(
                        //routerDelegate: locator<GoRouter>().routerDelegate,
                        //routeInformationParser: locator<GoRouter>().routeInformationParser,
                        //routeInformationProvider: goRouter.routeInformationProvider,

                        localizationsDelegates: const [
                          Strings.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        locale: const Locale('en'),
                        supportedLocales: L10n.all,
                        debugShowCheckedModeBanner: false,
                        theme: AppTheme.lightTheme,
                        darkTheme: AppTheme.darkTheme,

                        //THEME CHANGE
                        themeMode: themeState.themeMode,
                        routerConfig: goRouter));
          }));
}
