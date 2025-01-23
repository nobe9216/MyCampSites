import 'package:flutter/material.dart';

class MainTheme extends StatelessWidget {
  const MainTheme({
    super.key,
    this.data,
    this.darkData,
    required this.child,
  });

  final Widget child;

  final ThemeData? data;
  final ThemeData? darkData;

  static MainThemeData of(BuildContext context) =>
      MainThemeData(brightness: Theme.of(context).brightness);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeData = theme.brightness == Brightness.light
        ? data ?? MainThemeData.light()
        : darkData ?? MainThemeData.dark();
    return Theme(
      data: themeData,
      child: child,
    );
  }
}

@immutable
class MainThemeData {
  factory MainThemeData({
    required Brightness brightness,
  }) {
    return MainThemeData._(
      brightness: brightness,
      commonTextColor: Colors.black,
    );
  }
  const MainThemeData._({
    required this.brightness,
    required this.commonTextColor,
  });

  final Brightness brightness;
  final Color commonTextColor;

  static ThemeData light() {
    final base = ThemeData();
    const primaryColor = Colors.green;
    const onPrimaryColor = Colors.white;
    const commonBackgroundColor = Colors.white;

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: onPrimaryColor,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
      ),
      cardTheme: base.cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: commonBackgroundColor,
      ),
      dialogTheme: base.dialogTheme.copyWith(
        backgroundColor: commonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  static ThemeData dark() => light();
}
