import "package:flutter/material.dart";

class MaterialThemeCustom {
  final TextTheme textTheme;

  const MaterialThemeCustom(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff515b92),
      surfaceTint: Color(0xff515b92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdee0ff),
      onPrimaryContainer: Color(0xff394379),
      secondary: Color(0xff5b5d72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdfe1f9),
      onSecondaryContainer: Color(0xff434659),
      tertiary: Color(0xff76546d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd7f2),
      onTertiaryContainer: Color(0xff5d3c55),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff46464f),
      outline: Color(0xff767680),
      outlineVariant: Color(0xffc6c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff0a154b),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff394379),
      secondaryFixed: Color(0xffdfe1f9),
      onSecondaryFixed: Color(0xff171a2c),
      secondaryFixedDim: Color(0xffc3c5dd),
      onSecondaryFixedVariant: Color(0xff434659),
      tertiaryFixed: Color(0xffffd7f2),
      onTertiaryFixed: Color(0xff2d1228),
      tertiaryFixedDim: Color(0xffe5bad8),
      onTertiaryFixedVariant: Color(0xff5d3c55),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe3e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }


  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac3ff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff222c61),
      primaryContainer: Color(0xff394379),
      onPrimaryContainer: Color(0xffdee0ff),
      secondary: Color(0xffc3c5dd),
      onSecondary: Color(0xff2c2f42),
      secondaryContainer: Color(0xff434659),
      onSecondaryContainer: Color(0xffdfe1f9),
      tertiary: Color(0xffe5bad8),
      onTertiary: Color(0xff44263e),
      tertiaryContainer: Color(0xff5d3c55),
      onTertiaryContainer: Color(0xffffd7f2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121318),
      onSurface: Color(0xffe3e1e9),
      onSurfaceVariant: Color(0xffc6c5d0),
      outline: Color(0xff90909a),
      outlineVariant: Color(0xff46464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1e9),
      inversePrimary: Color(0xff515b92),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff0a154b),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff394379),
      secondaryFixed: Color(0xffdfe1f9),
      onSecondaryFixed: Color(0xff171a2c),
      secondaryFixedDim: Color(0xffc3c5dd),
      onSecondaryFixedVariant: Color(0xff434659),
      tertiaryFixed: Color(0xffffd7f2),
      onTertiaryFixed: Color(0xff2d1228),
      tertiaryFixedDim: Color(0xffe5bad8),
      onTertiaryFixedVariant: Color(0xff5d3c55),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff29292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
      elevation: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsetsGeometry.all(16),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1.5, color: colorScheme.secondary),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1.5, color: colorScheme.primary),
      ),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          colorScheme.onPrimaryContainer,
        ),
        backgroundColor: WidgetStateProperty.all(colorScheme.primaryContainer),
      ),
    ),

    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xffbe7a00),
    value: Color(0xffbe7a00),
    light: ColorFamily(
      color: Color(0xff815200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffa36800),
      onColorContainer: Color(0xfffffbff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff815200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffa36800),
      onColorContainer: Color(0xfffffbff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff815200),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffa36800),
      onColorContainer: Color(0xfffffbff),
    ),
    dark: ColorFamily(
      color: Color(0xffffb95c),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc7820e),
      onColorContainer: Color(0xff321d00),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb95c),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc7820e),
      onColorContainer: Color(0xff321d00),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb95c),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc7820e),
      onColorContainer: Color(0xff321d00),
    ),
  );

  /// Custom Color 2
  static const customColor2 = ExtendedColor(
    seed: Color(0xffc78624),
    value: Color(0xffc78624),
    light: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
    dark: ColorFamily(
      color: Color(0xffffb95b),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb95b),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb95b),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffc78624),
      onColorContainer: Color(0xff412700),
    ),
  );

  /// Custom Color 3
  static const customColor3 = ExtendedColor(
    seed: Color(0xffe19200),
    value: Color(0xffe19200),
    light: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff845400),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
    dark: ColorFamily(
      color: Color(0xffffb95a),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb95a),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb95a),
      onColor: Color(0xff462a00),
      colorContainer: Color(0xffe19200),
      onColorContainer: Color(0xff523200),
    ),
  );

  List<ExtendedColor> get extendedColors => [
    customColor1,
    customColor2,
    customColor3,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
