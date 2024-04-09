import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/property.dart';
import 'color.dart';
import 'text_style.dart';

///APPBAR SHAPE
/*
class Cuvedshape extends ContinuousRectangleBorder {
  const Cuvedshape(this.curveheights);
  final double curveheights;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(rect.size.width / 1,
        rect.size.height + curveheights * 1, rect.size.width, rect.size.height)
    ..lineTo(rect.size.width, 0)
    ..close();
}*/

// AppTheme class that contains the dark and the light theme for the app
class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: ColorConstant.isMaterial3,
      splashFactory: InkRipple.splashFactory,
      navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: const Color(0xFFFA4F26),
          indicatorColor: ColorConstant.primaryThemeColor,
          labelTextStyle:
              MaterialStateProperty.all(const TextStyle(fontSize: 13.0))),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      }),
      snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.red,
          backgroundColor: const Color(0xFFD6D6D6),
          contentTextStyle: TextStyleConstant.headLine3LightTextTheme),
      textTheme: TextTheme(
          headlineMedium: TextStyleConstant.headLine4LightTextTheme,
          headlineSmall: TextStyleConstant.headLine5LightTextTheme,
          displayLarge: TextStyleConstant.headLine1LightTextTheme,
          displayMedium: TextStyleConstant.headLine2LightTextTheme,
          displaySmall: TextStyleConstant.headLine3LightTextTheme,
          labelLarge: TextStyleConstant.buttonLightTextTheme,
          labelSmall: TextStyleConstant.overLineLightTextTheme,
          titleLarge: TextStyleConstant.headLine6LightTextTheme,
          titleMedium: TextStyleConstant.subTitle1LightTextTheme,
          titleSmall: TextStyleConstant.subTitle2LightTextTheme,
          bodyLarge: TextStyleConstant.bodyText1LightTextTheme,
          bodyMedium: TextStyleConstant.bodyText2LightTextTheme,
          bodySmall: TextStyleConstant.captionLightTextTheme),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          primary: ColorConstant.primaryThemeColor,
          onPrimary: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFFFFDADA),
          onPrimaryContainer: const Color(0xFFFA4F26),
          secondary: const Color(0xFF000000),
          onSecondary: const Color(0xFFFFFFFF),
          secondaryContainer: const Color(0xFFFFDADA),
          onSecondaryContainer: const Color(0xFFFA4F26),
          tertiary: const Color(0xFF000000),
          onTertiary: const Color(0xFFFFFFFF),
          tertiaryContainer: const Color(0xFFFFDDB2),
          onTertiaryContainer: const Color(0xFFFA4F26),
          error: const Color(0xFFBA1A1A),
          onError: const Color(0xFFFFFFFF),
          errorContainer: const Color(0xFFFFDAD6),
          onErrorContainer: const Color(0xFFD6D6D6),
          outline: const Color(0xFF000000),
          background: const Color(0xFFFFFFFF),
          onBackground: const Color(0xFF201A1A),
          surface: const Color(0xFFFFFBFF),
          onSurface: const Color(0xFF201A1A),
          surfaceVariant: const Color(0xFFF4DDDD),
          onSurfaceVariant: const Color(0xFF000000),
          inverseSurface: const Color(0xFF362F2F),
          onInverseSurface: const Color(0xFFFBEEED),
          inversePrimary: const Color(0xFFFFB3B6),
          shadow: const Color(0xFF000000),
          surfaceTint: Colors.transparent,
          outlineVariant: const Color(0xFF8C9DA8).withOpacity(0.2),
          scrim: const Color(0xFF000000),
          seedColor: ColorConstant.primaryThemeColor),
      focusColor: ColorConstant.focusLightThemeColor,
      hintColor: ColorConstant.hintLightThemeColor,
      unselectedWidgetColor: ColorConstant.unSelectedWidgetLightThemeColor,
      shadowColor: ColorConstant.selectedRowLightThemeColor,
      iconTheme: const IconThemeData(color: ColorConstant.iconLightThemeColor),
      indicatorColor: ColorConstant.indicatorLightThemeColor,
      cardTheme: CardTheme(
          shape: PropertyConstant.cardShapeBorder,
          color: ColorConstant.cardLightThemeColor),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              textStyle: TextStyleConstant.buttonTextStyle,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 10))),
      appBarTheme: AppBarTheme(
          surfaceTintColor: const Color(0xFFFA4F26),
          //shape: const RoundedRectangleBorder(),
          //shape: const Cuvedshape(40),
          elevation: 0.0,
          titleSpacing: 0,
          centerTitle: true,
          titleTextStyle: TextStyleConstant.titleMediumLightTheme),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyleConstant.headLine2LightTextTheme,
          floatingLabelStyle: TextStyleConstant.headLine5LightTextTheme,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.inputBorderLightColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide: const BorderSide(
                  color: ColorConstant.inputEnabledBorderLightColor)),
          errorStyle: TextStyleConstant.errorTextFieldTheme,
          errorMaxLines: 1,
          errorBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor))),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyleConstant.bodyText1LightTextTheme)));

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: ColorConstant.isMaterial3,
      splashFactory: InkRipple.splashFactory,
      navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: const Color(0xFF000000),
          indicatorColor: ColorConstant.primaryThemeColor,
          labelTextStyle:
              MaterialStateProperty.all(const TextStyle(fontSize: 13.0))),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      }),
      snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.red,
          backgroundColor: const Color(0xFFD6D6D6),
          contentTextStyle: TextStyleConstant.headLine3DarkTextTheme),
      textTheme: TextTheme(
          headlineMedium: TextStyleConstant.headLine4DarkTextTheme,
          headlineSmall: TextStyleConstant.headLine5DarkTextTheme,
          displayLarge: TextStyleConstant.headLine1DarkTextTheme,
          displayMedium: TextStyleConstant.headLine2DarkTextTheme,
          displaySmall: TextStyleConstant.headLine3DarkTextTheme,
          labelLarge: TextStyleConstant.buttonLightTextTheme,
          labelSmall: TextStyleConstant.overLineLightTextTheme,
          titleLarge: TextStyleConstant.headLine6DarkTextTheme,
          titleMedium: TextStyleConstant.subTitle1DarkTextTheme,
          titleSmall: TextStyleConstant.subTitle2DarkTextTheme,
          bodyLarge: TextStyleConstant.bodyText1DarkTextTheme,
          bodyMedium: TextStyleConstant.bodyText2DarkTextTheme,
          bodySmall: TextStyleConstant.captionLightTextTheme),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          primary: ColorConstant.primaryThemeColor,
          onPrimary: const Color(0xFF680019),
          primaryContainer: const Color(0xFFFA4F26),
          onPrimaryContainer: const Color(0xFFFFDADA),
          secondary: const Color(0xFFE6BDBD),
          onSecondary: const Color(0xFFFA4F26),
          secondaryContainer: const Color(0xFF5D3F40),
          onSecondaryContainer: const Color(0xFFFFDADA),
          tertiary: const Color(0xFFE6C08D),
          onTertiary: const Color(0xFF432C06),
          tertiaryContainer: const Color(0xFF5C421A),
          onTertiaryContainer: const Color(0xFFFA4F26),
          error: const Color(0xFFFFB4AB),
          onError: const Color(0xFF690005),
          errorContainer: const Color(0xFF93000A),
          onErrorContainer: const Color(0xFFFFFFFF),
          outline: const Color(0xFF9F8C8C),
          background: ColorConstant.scaffoldBackgroundDarkThemeColor,
          onBackground: const Color(0xFFECE0DF),
          surface: ColorConstant.scaffoldBackgroundDarkThemeColor,
          onSurface: const Color(0xFFECE0DF),
          surfaceVariant: const Color(0xFF524343),
          onSurfaceVariant: const Color(0xFFD7C1C1),
          inverseSurface: const Color(0xFFECE0DF),
          onInverseSurface: const Color(0xFF201A1A),
          inversePrimary: const Color(0xFFFA4F26),
          shadow: const Color(0xFF000000),
          surfaceTint: ColorConstant.cardDarkThemeColor,
          outlineVariant: ColorConstant.dividerDarkThemeColor,
          scrim: const Color(0xFF000000),
          seedColor: ColorConstant.primaryThemeColor),
      focusColor: ColorConstant.focusDarkThemeColor,
      hintColor: ColorConstant.hintDarkThemeColor,
      unselectedWidgetColor: ColorConstant.unSelectedWidgetDarkThemeColor,
      shadowColor: ColorConstant.selectedRowDarkThemeColor,
      iconTheme: const IconThemeData(color: ColorConstant.iconDarkThemeColor),
      indicatorColor: ColorConstant.indicatorDarkThemeColor,
      cardTheme: CardTheme(
          shape: PropertyConstant.cardShapeBorder,
          color: ColorConstant.cardDarkThemeColor),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              textStyle: TextStyleConstant.buttonTextStyle,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 10))),
      appBarTheme: AppBarTheme(
          surfaceTintColor: const Color(0xFF000000),
          //shape: const RoundedRectangleBorder(),
          //shape: const Cuvedshape(40),
          elevation: 0.0,
          titleSpacing: 0,
          centerTitle: true,
          titleTextStyle: TextStyleConstant.titleMediumDarkTheme),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyleConstant.headLine2DarkTextTheme,
          floatingLabelStyle: TextStyleConstant.headLine5DarkTextTheme,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.inputBorderDarkColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide: const BorderSide(
                  color: ColorConstant.inputEnabledBorderDarkColor)),
          errorStyle: TextStyleConstant.errorTextFieldTheme,
          errorMaxLines: 1,
          errorBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: PropertyConstant.textFieldBorderRadius,
              borderSide:
                  const BorderSide(color: ColorConstant.primaryThemeColor))),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyleConstant.bodyText1DarkTextTheme)));

/*static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6750A4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEADDFF),
    onPrimaryContainer: Color(0xFF21005D),
    secondary: Color(0xFF625B71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF1D192B),
    tertiary: Color(0xFF7D5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    onTertiaryContainer: Color(0xFF31111D),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
    outline: Color(0xFF79747E),
    background: Color(0xFFFFFBFE),
    onBackground: Color(0xFF1C1B1F),
    surface: Color(0xFFFFFBFE),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6750A4),
    outlineVariant: Color(0xFFCAC4D0),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    outline: Color(0xFF938F99),
    background: Color(0xFF1C1B1F),
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF6750A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD0BCFF),
    outlineVariant: Color(0xFF49454F),
    scrim: Color(0xFF000000),
  );*/
}
