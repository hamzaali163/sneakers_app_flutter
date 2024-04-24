import 'dart:async';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    if (auth.currentUser == null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteNames.pageViewScreen);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RouteNames.navbarscreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage('images/Nike logo.png'))),
        ],
      ),
    );
  }
}
