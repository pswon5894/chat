import 'package:flutter/material.dart';

// 하나의 코드 베이스에 라이트 모드 다크 모드 적용 시키기
ThemeData initThemeData({required Brightness brightness}) {
  if (brightness == Brightness.light) {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.redAccent,
        secondary: Colors.orange,

        tertiary: Colors.white,
        inversePrimary: Colors.grey.shade900,
      ),
   );
  } else {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.blueAccent,
        secondary: Colors.greenAccent,

        tertiary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade300,
      ),
    );
  }
}