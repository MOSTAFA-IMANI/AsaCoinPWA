import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(-205056),
      surfaceTint: Color(4285226768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294304649),
      onPrimaryContainer: Color(4280359936),
      secondary: Color(4284833601),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293714876),
      onSecondaryContainer: Color(4280294405),
      tertiary: Color(4286796820),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958521),
      onTertiaryContainer: Color(4281014016),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965739),
      onBackground: Color(4280097811),
      surface: Color(4294965739),
      onSurface: Color(4280097811),
      surfaceVariant: Color(4293518032),
      onSurfaceVariant: Color(4283057977),
      outline: Color(4286281576),
      outlineVariant: Color(4291610293),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544743),
      inverseOnSurface: Color(4294373602),
      inversePrimary: Color(4292396912),
      primaryFixed: Color(4294304649),
      onPrimaryFixed: Color(4280359936),
      primaryFixedDim: Color(4292396912),
      onPrimaryFixedVariant: Color(4283516672),
      secondaryFixed: Color(4293714876),
      onSecondaryFixed: Color(4280294405),
      secondaryFixedDim: Color(4291872674),
      onSecondaryFixedVariant: Color(4283254571),
      tertiaryFixed: Color(4294958521),
      onTertiaryFixed: Color(4281014016),
      tertiaryFixedDim: Color(4294556529),
      onTertiaryFixedVariant: Color(4284890624),
      surfaceDim: Color(4292860620),
      surfaceBright: Color(4294965739),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570981),
      surfaceContainer: Color(4294176224),
      surfaceContainerHigh: Color(4293847258),
      surfaceContainerHighest: Color(4293452500),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283253504),
      surfaceTint: Color(4285226768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286739751),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282925863),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286346581),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284561920),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288440873),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965739),
      onBackground: Color(4280097811),
      surface: Color(4294965739),
      onSurface: Color(4280097811),
      surfaceVariant: Color(4293518032),
      onSurfaceVariant: Color(4282794806),
      outline: Color(4284702545),
      outlineVariant: Color(4286544747),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544743),
      inverseOnSurface: Color(4294373602),
      inversePrimary: Color(4292396912),
      primaryFixed: Color(4286739751),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285029390),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286346581),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284636222),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288440873),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286599697),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860620),
      surfaceBright: Color(4294965739),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570981),
      surfaceContainer: Color(4294176224),
      surfaceContainerHigh: Color(4293847258),
      surfaceContainerHighest: Color(4293452500),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280820224),
      surfaceTint: Color(4285226768),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283253504),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280754697),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282925863),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281605376),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284561920),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965739),
      onBackground: Color(4280097811),
      surface: Color(4294965739),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293518032),
      onSurfaceVariant: Color(4280755224),
      outline: Color(4282794806),
      outlineVariant: Color(4282794806),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544743),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294962577),
      primaryFixed: Color(4283253504),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281609472),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282925863),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281478419),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284561920),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282525184),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860620),
      surfaceBright: Color(4294965739),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570981),
      surfaceContainer: Color(4294176224),
      surfaceContainerHigh: Color(4293847258),
      surfaceContainerHighest: Color(4293452500),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(-205056),
      surfaceTint: Color(4292396912),
      onPrimary: Color(4281872384),
      primaryContainer: Color(4283516672),
      onPrimaryContainer: Color(4294304649),
      secondary: Color(4291872674),
      onSecondary: Color(4281676054),
      secondaryContainer: Color(4283254571),
      onSecondaryContainer: Color(4293714876),
      tertiary: Color(4294556529),
      onTertiary: Color(4282853888),
      tertiaryContainer: Color(4284890624),
      onTertiaryContainer: Color(4294958521),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279571212),
      onBackground: Color(4293452500),
      surface: Color(4279571212),
      onSurface: Color(4293452500),
      surfaceVariant: Color(4283057977),
      onSurfaceVariant: Color(4291610293),
      outline: Color(4287992192),
      outlineVariant: Color(4283057977),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452500),
      inverseOnSurface: Color(4281544743),
      inversePrimary: Color(4285226768),
      primaryFixed: Color(4294304649),
      onPrimaryFixed: Color(4280359936),
      primaryFixedDim: Color(4292396912),
      onPrimaryFixedVariant: Color(4283516672),
      secondaryFixed: Color(4293714876),
      onSecondaryFixed: Color(4280294405),
      secondaryFixedDim: Color(4291872674),
      onSecondaryFixedVariant: Color(4283254571),
      tertiaryFixed: Color(4294958521),
      onTertiaryFixed: Color(4281014016),
      tertiaryFixedDim: Color(4294556529),
      onTertiaryFixedVariant: Color(4284890624),
      surfaceDim: Color(4279571212),
      surfaceBright: Color(4282136880),
      surfaceContainerLowest: Color(4279242247),
      surfaceContainerLow: Color(4280097811),
      surfaceContainer: Color(4280426519),
      surfaceContainerHigh: Color(4281084449),
      surfaceContainerHighest: Color(4281808171),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4292660340),
      surfaceTint: Color(4292396912),
      onPrimary: Color(4279965184),
      primaryContainer: Color(4288713024),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292135846),
      onSecondary: Color(4279899650),
      secondaryContainer: Color(4288254319),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294819701),
      onTertiary: Color(4280553984),
      tertiaryContainer: Color(4290545218),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279571212),
      onBackground: Color(4293452500),
      surface: Color(4279571212),
      onSurface: Color(4294966004),
      surfaceVariant: Color(4283057977),
      onSurfaceVariant: Color(4291939001),
      outline: Color(4289242002),
      outlineVariant: Color(4287136627),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452500),
      inverseOnSurface: Color(4281084449),
      inversePrimary: Color(4283582464),
      primaryFixed: Color(4294304649),
      onPrimaryFixed: Color(4279570688),
      primaryFixedDim: Color(4292396912),
      onPrimaryFixedVariant: Color(4282267136),
      secondaryFixed: Color(4293714876),
      onSecondaryFixed: Color(4279570688),
      secondaryFixedDim: Color(4291872674),
      onSecondaryFixedVariant: Color(4282070556),
      tertiaryFixed: Color(4294958521),
      onTertiaryFixed: Color(4280094208),
      tertiaryFixedDim: Color(4294556529),
      onTertiaryFixedVariant: Color(4283379456),
      surfaceDim: Color(4279571212),
      surfaceBright: Color(4282136880),
      surfaceContainerLowest: Color(4279242247),
      surfaceContainerLow: Color(4280097811),
      surfaceContainer: Color(4280426519),
      surfaceContainerHigh: Color(4281084449),
      surfaceContainerHighest: Color(4281808171),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294966004),
      surfaceTint: Color(4292396912),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292660340),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966004),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292135846),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294819701),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279571212),
      onBackground: Color(4293452500),
      surface: Color(4279571212),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283057977),
      onSurfaceVariant: Color(4294966004),
      outline: Color(4291939001),
      outlineVariant: Color(4291939001),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452500),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4281412096),
      primaryFixed: Color(4294568077),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292660340),
      onPrimaryFixedVariant: Color(4279965184),
      secondaryFixed: Color(4294043585),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292135846),
      onSecondaryFixedVariant: Color(4279899650),
      tertiaryFixed: Color(4294959813),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294819701),
      onTertiaryFixedVariant: Color(4280553984),
      surfaceDim: Color(4279571212),
      surfaceBright: Color(4282136880),
      surfaceContainerLowest: Color(4279242247),
      surfaceContainerLow: Color(4280097811),
      surfaceContainer: Color(4280426519),
      surfaceContainerHigh: Color(4281084449),
      surfaceContainerHighest: Color(4281808171),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
