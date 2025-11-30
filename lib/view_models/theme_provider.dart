import 'package:flutter/material.dart';
import 'package:mvvm_state_management/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider {
  ThemeData _themeData = MyThemeData.lightTheme;
  Future<void> toggleTheme() async {
    final String themeKey = "isDarkMode";
    final pref = await SharedPreferences.getInstance();
    _themeData = _themeData == MyThemeData.darkTheme
        ? MyThemeData.lightTheme
        : MyThemeData.darkTheme;
    await pref.setBool(themeKey, _themeData == MyThemeData.darkTheme);
  }
}
