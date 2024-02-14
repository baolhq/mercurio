import 'package:flutter/material.dart';
import 'package:mercurio/screens/welcome.dart';
import 'package:mercurio/themed_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mercurio',
        theme: ThemeData(
            useMaterial3: true,
            dividerColor: ThemedColor.surface,
            primaryColor: ThemedColor.primary,
            primaryColorDark: ThemedColor.primaryVariant,
            scaffoldBackgroundColor: ThemedColor.background,
            cardColor: ThemedColor.background,
            textTheme: const TextTheme(
                bodyMedium: TextStyle(color: ThemedColor.surface)),
            buttonTheme:
                const ButtonThemeData(buttonColor: ThemedColor.primary),
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: ThemedColor.primary,
              selectionHandleColor: ThemedColor.primary,
            )),
        home: const WelcomeScreen());
  }
}
