import 'package:ecommerce_app/view/splash_screen/screen_four.dart';
import 'package:ecommerce_app/view/splash_screen/screen_three.dart';
import 'package:ecommerce_app/view/splash_screen/screentwo.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [ScreenTwo(), ScreenThree(), ScreenFour()],
      ),
    );
  }
}
