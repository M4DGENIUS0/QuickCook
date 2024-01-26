import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/onboarding%20pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cooking App',
      theme:
          ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: Onboarding_Screen(),
    );
  }
}
