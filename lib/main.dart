import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/ui_color.dart';
import 'views/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Circular Std',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hintColor: netflixMaroon,
        indicatorColor: netflixMaroon,
        accentColor: netflixMaroon,
        textSelectionColor: netflixMaroon,
        focusColor: netflixMaroon,
        primaryColor: netflixMaroon,
      ),
      home: OnboardingScreen(),
    );
  }
}

