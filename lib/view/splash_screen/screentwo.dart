import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .15),
                child: const Column(
                  children: [
                    Center(
                        child: Text(
                      "Welcome To ",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 30,
                          color: Color(
                            0xffECECEC,
                          ),
                          fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      "Nike",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 30,
                          color: Color(
                            0xffECECEC,
                          ),
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: const Image(
                    image: AssetImage(
                  'images/design1.png',
                )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .43,
                    right: MediaQuery.of(context).size.width * .55),
                child: const Image(
                    image: AssetImage(
                  'images/smiley.png',
                )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .15),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(
                      'images/image1.png',
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .56),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Image(
                          image: AssetImage(
                        'images/Vector.png',
                      )))),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .73),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 42, height: 5, color: const Color(0xffFFB21A)),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(width: 28, height: 5, color: Colors.white),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: 28,
                        height: 5,
                        color: Colors.white,
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .75,
                      right: MediaQuery.of(context).size.width * .7),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Image(
                          image: AssetImage(
                        'images/decor2.png',
                      )))),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .7,
                    left: MediaQuery.of(context).size.width * .7),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(
                      'images/decor.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .90),
                child: RoundButtonOne(
                    onpress: () {
                      Navigator.pushNamed(context, RouteNames.loginScreen);
                    },
                    title: 'Get Started'),
              ),
            ],
          )),
    );
  }
}
