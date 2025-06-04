import 'package:flutter/material.dart';
import 'package:my_project/theme/colors.dart';

class AppTheme{
    static final defaultTheme= ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor2,
      appBarTheme: AppBarTheme(
        backgroundColor: AppPallete.backgroundColor2,
      ),
      
    );
}