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
  const MainThemeData._();

  static ThemeData light() {
    final base = ThemeData();
    const primaryColor = Colors.green;
    const onPrimaryColor = Colors.white;

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
        color: Colors.white,
      ),
    );
  }

  static ThemeData dark() => light();
}
