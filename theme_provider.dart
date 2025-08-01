import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDark
        ? ThemeData.dark().copyWith(
            cardTheme: const CardThemeData(
              color: Colors.grey,
              elevation: 4,
            ),
          )
        : ThemeData.light().copyWith(
            cardTheme: const CardThemeData(
              color: Colors.white,
              elevation: 4,
            ),
          );
    notifyListeners();
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeData = _themeData.brightness == Brightness.light
        ? ThemeData.dark().copyWith(
            cardTheme: const CardThemeData(
              color: Colors.grey,
              elevation: 4,
            ),
          )
        : ThemeData.light().copyWith(
            cardTheme: const CardThemeData(
              color: Colors.white,
              elevation: 4,
            ),
          );
    await prefs.setBool('isDarkMode', _themeData.brightness == Brightness.dark);
    notifyListeners();
  }
}