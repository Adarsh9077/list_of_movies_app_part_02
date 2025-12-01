import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = MyThemeData.lightTheme;
  ThemeData get themeData => _themeData;
  final String themeKey = "isDarkMode";
  Future<void> toggleTheme() async {
    final pref = await SharedPreferences.getInstance();
    _themeData = _themeData == MyThemeData.darkTheme
        ? MyThemeData.lightTheme
        : MyThemeData.darkTheme;
    await pref.setBool(themeKey, _themeData == MyThemeData.darkTheme);
    notifyListeners();
  }
}
