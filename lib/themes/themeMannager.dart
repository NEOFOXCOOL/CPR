import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  get thememode => _themeMode;
  toggleTheme(bool isDark){
    _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
  }
}