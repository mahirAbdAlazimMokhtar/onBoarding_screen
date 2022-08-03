import 'package:flutter/material.dart';
import 'package:on_boarding/onboarding_screen.dart';
void main (){
  runApp(OnBoardingApp());
}

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white
      ),
      title: 'OnBoarding Screen',
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
