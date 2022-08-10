import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static MaterialColor primary = Colors.orange;
  static Color primaryContainer = Colors.orange.shade300;
  static const Color secondary = Colors.orangeAccent;
  static Color tertiary = Colors.green.shade400;
  static Color ontertiary = Colors.red.shade400;
  static const Color error = Color.fromARGB(255, 255, 95, 21);

  //light colors
  static Color surface = Colors.white;
  static Color secondaryContainer = Colors.grey.shade50;
  static Color surfaceVariant = const Color.fromARGB(255, 167, 196, 228);
  static Color background = const Color(0xFFf9f8f8);
  static Color onColor = Colors.grey.shade700;

  //dark colors
  static Color surfaceD = Colors.grey.shade800.withOpacity(.5);
  static Color secondaryContainerD = Colors.grey.shade900;
  static Color surfaceVariantD = const Color.fromARGB(255, 76, 89, 104);
  static Color backgroundD = const Color.fromARGB(255, 24, 27, 34);
  static Color onColorD = Colors.grey;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: primary,
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      color: background,
      elevation: 0,
      titleTextStyle: const TextTheme().headline5,
      iconTheme: const IconThemeData().copyWith(color: onColor),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 60,
      backgroundColor: background,
      indicatorColor: Colors.transparent,
      labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => TextStyle(
          color: states.contains(MaterialState.selected) ? primary : onColor,
        ),
      ),
      iconTheme: MaterialStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(MaterialState.selected) ? primary : onColor,
        ),
      ),
      elevation: 0,
    ),
    textTheme: textTheme(false),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected) ? primary : onColor,
      ),
      trackColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected) ? primary : onColor,
      ),
    ),
    iconTheme: IconThemeData(
      color: onColor,
    ),
    cardTheme: CardTheme(
      color: surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    dividerColor: surfaceVariant,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(background),
      fillColor: MaterialStateProperty.all(primary),
    ),
    tabBarTheme: TabBarTheme(
      // labelColor: onColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: primary,
          width: 1,
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      selectedTileColor: surface,
      tileColor: background,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade300,
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: Colors.grey,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected) ? primary : onColorD),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: background,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0,
      backgroundColor: background,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.disabled) ? onColor : primary,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.disabled) ? onColorD : Colors.black,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    colorScheme: colorscheme(false),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: primary,
    scaffoldBackgroundColor: backgroundD,
    appBarTheme: AppBarTheme(
      color: backgroundD,
      elevation: 0,
      titleTextStyle: const TextTheme().headline5,
      iconTheme: const IconThemeData().copyWith(color: onColorD),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 60,
      backgroundColor: backgroundD,
      indicatorColor: Colors.transparent,
      labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => TextStyle(
          color: states.contains(MaterialState.selected) ? primary : onColorD,
        ),
      ),
      iconTheme: MaterialStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(MaterialState.selected) ? primary : onColorD,
        ),
      ),
      elevation: 0,
    ),
    textTheme: textTheme(true),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
        (states) =>
            states.contains(MaterialState.selected) ? primary : onColorD,
      ),
      trackColor: MaterialStateProperty.resolveWith(
        (states) =>
            states.contains(MaterialState.selected) ? primary : onColorD,
      ),
    ),
    iconTheme: IconThemeData(
      color: onColorD,
    ),
    cardTheme: CardTheme(
      color: surfaceD,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    dividerColor: surfaceVariantD,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(backgroundD),
      fillColor: MaterialStateProperty.all(primary),
    ),
    tabBarTheme: TabBarTheme(
      // labelColor: onColorD,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: primary,
          width: 1,
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      selectedTileColor: surfaceD,
      tileColor: backgroundD,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceD,
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceD,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected) ? primary : onColorD),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: backgroundD,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0,
      backgroundColor: backgroundD,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.disabled) ? onColor : primary,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.disabled) ? onColorD : Colors.black,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    colorScheme: colorscheme(true),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ColorScheme colorscheme(bool isdark) {
    return ColorScheme(
      brightness: isdark ? Brightness.dark : Brightness.light,
      primary: primary,
      onPrimary: isdark ? onColorD : onColor,
      primaryContainer: primaryContainer,
      onPrimaryContainer: isdark ? onColorD : onColor,
      secondary: secondary,
      onSecondary: isdark ? onColorD : onColor,
      secondaryContainer: isdark ? secondaryContainerD : secondaryContainer,
      onSecondaryContainer: isdark ? onColorD : onColor,
      tertiary: tertiary,
      onTertiary: ontertiary,
      tertiaryContainer: surfaceD,
      onTertiaryContainer: Colors.grey,
      background: isdark ? backgroundD : background,
      onBackground: isdark ? onColorD : onColor,
      surface: isdark ? surfaceD : surface,
      onSurface: isdark ? onColorD : onColor,
      surfaceVariant: isdark ? surfaceVariantD : surfaceVariant,
      // onSurfaceVariant: Colors.white,
      // outline: Colors.grey,
      // shadow: Colors.grey,
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
      // inversePrimary: Colors.grey,

      error: error,
      onError: isdark ? onColorD : onColor,
      // errorContainer: Colors.grey,
      // onErrorContainer: Colors.grey,
    );
  }

  static TextTheme textTheme(bool isDark) {
    return TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline2: GoogleFonts.roboto(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline3: GoogleFonts.roboto(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline4: GoogleFonts.roboto(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline5: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline6: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: isDark ? Colors.white : Colors.black,
      ),
      subtitle1: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: isDark ? Colors.white : Colors.black,
      ),
      subtitle2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: isDark ? Colors.white : Colors.black,
      ),
      bodyText1: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: isDark ? Colors.white : Colors.black,
      ),
      bodyText2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: isDark ? Colors.white : Colors.black,
      ),
      button: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: isDark ? Colors.white : Colors.black,
      ),
      caption: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: isDark ? Colors.white : Colors.black,
      ),
      overline: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }
}
