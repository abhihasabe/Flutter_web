import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemes {
  static ThemeData baseLight = ThemeData.light();
  static ThemeData baseDark = ThemeData.dark();

  static final darkTheme = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: backgroundDarkColor,
    accentColor: accentDarkColor,
    indicatorColor: indicatorDarkColor,
    buttonColor: buttonDarkColor,
    hintColor: hintDarkColor,
    highlightColor: highlightDarkColor,
    hoverColor: hoverColorDarkColor,
    focusColor: focusColor,
    disabledColor: disabledColor,
    cardColor: cardDarkColor,
    errorColor: errorColor,
    //appBarTheme: _appBarTheme("darkTheme"),
    iconTheme: IconThemeData(color: iconDarkColor, opacity: 0.8),
    textTheme: _customTextTheme(baseDark.textTheme,textDarkColor, "darkTheme"),
    primaryTextTheme: _customTextTheme(baseDark.primaryTextTheme,textDarkColor, "darkTheme"),
    accentTextTheme: _customTextTheme(baseDark.accentTextTheme,textDarkColor, "darkTheme"),
    colorScheme: ColorScheme.dark(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: iconDarkColor.withOpacity(0.7),
      unselectedItemColor: iconDarkColor.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: primaryDarkColor),
      showUnselectedLabels: true,
    ),
    buttonTheme: ThemeData.light().buttonTheme.copyWith(buttonColor: Colors.white,
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.white)),
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    accentColor: accentColor,
    indicatorColor: indicatorColor,
    buttonColor: buttonColor,
    hintColor: hintColor,
    highlightColor: highlightColor,
    hoverColor: hoverColor,
    focusColor: focusColorDarkColor,
    disabledColor: disabledColor,
    cardColor: cardColor,
    errorColor: errorColor,
    //appBarTheme: _appBarTheme("lightTheme"),
    iconTheme: IconThemeData(color: iconColor, opacity: 0.8),
    primaryIconTheme: ThemeData.light().primaryIconTheme.copyWith(color: const Color(0xFF442B2D)),
    textTheme: _customTextTheme(baseLight.textTheme,textColor, "lightTheme"),
    primaryTextTheme: _customTextTheme(baseLight.primaryTextTheme,textColor, "lightTheme"),
    accentTextTheme: _customTextTheme(baseLight.accentTextTheme,textColor, "lightTheme"),
    buttonTheme: ThemeData.light().buttonTheme.copyWith(buttonColor: Colors.black,
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.black)),
    colorScheme: ColorScheme.light(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: iconColor.withOpacity(0.7),
      unselectedItemColor: iconColor.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: primaryColor),
      showUnselectedLabels: true,
    ),
  );

  static TextTheme _customTextTheme(TextTheme base, Color color, String theme) {
    return base.copyWith(
      headline6: base.headline6!.copyWith(fontWeight: FontWeight.w500, fontSize: 20.0, letterSpacing:  0.15, color: theme.contains("darkTheme")?textDarkColor:textColor),
      headline5: base.headline5!.copyWith(fontWeight: FontWeight.w400, fontSize: 24.0, letterSpacing:  0.0,  color: theme.contains("darkTheme")?textDarkColor:textColor),
      headline4: base.headline4!.copyWith(fontWeight: FontWeight.w400, fontSize: 34.0, letterSpacing:  0.25, color: theme.contains("darkTheme")?textDarkColor:textColor),
      headline3: base.headline3!.copyWith(fontWeight: FontWeight.w400, fontSize: 48.0, letterSpacing:  0.0,  color: theme.contains("darkTheme")?textDarkColor:textColor),
      headline2: base.headline2!.copyWith(fontWeight: FontWeight.w300, fontSize: 60.0, letterSpacing: -0.5,  color: theme.contains("darkTheme")?textDarkColor:textColor),
      headline1: base.headline1!.copyWith(fontWeight: FontWeight.w300, fontSize: 96.0, letterSpacing: -1.5,  color: theme.contains("darkTheme")?textDarkColor:textColor),
      subtitle2: base.subtitle2!.copyWith(fontWeight: FontWeight.w500, fontSize: 14.0, letterSpacing:  0.10, color: theme.contains("darkTheme")?textDarkColor:textColor),
      subtitle1: base.subtitle1!.copyWith(fontWeight: FontWeight.w400, fontSize: 16.0, letterSpacing:  0.15, color: theme.contains("darkTheme")?textDarkColor:textColor),
      bodyText2: base.bodyText2!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0, letterSpacing:  0.25, color: theme.contains("darkTheme")?textDarkColor:textColor),
      bodyText1: base.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 16.0, letterSpacing:  0.5,  color: theme.contains("darkTheme")?textDarkColor:textColor),
      button:    base.button!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0, letterSpacing: 0.75 , color: theme.contains("darkTheme")?textDarkColor:textColor),
      caption:   base.caption!.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0, letterSpacing: 0.4 , color: theme.contains("darkTheme")?textDarkColor:textColor),
      overline:  base.overline!.copyWith(fontWeight: FontWeight.w400, fontSize: 10.0, letterSpacing: 1.5, color: theme.contains("darkTheme")?textDarkColor:textColor),
    ).apply(fontFamily: 'Roboto');
  }
/*
  static AppBarTheme _appBarTheme(String themeType) {
    return AppBarTheme(
      elevation: 0.0,
      color: themeType.contains("darkTheme")?textDarkColor:textColor,
      iconTheme: IconThemeData(
        color: themeType.contains("darkTheme")?iconDarkColor:iconColor,
      ));
  }*/
}