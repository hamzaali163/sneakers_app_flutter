import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

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
                    top: MediaQuery.of(context).size.height * .56),
                child: const Column(
                  children: [
                    Center(
                        child: Text(
                      "Lets Start Journey",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 34,
                          color: Color(
                            0xffECECEC,
                          ),
                          fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      "With Nike",
                      style: TextStyle(
                          fontFamily: 'Raleway-Bold',
                          fontSize: 34,
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
                    top: MediaQuery.of(context).size.height * .70),
                child: const Column(
                  children: [
                    Center(
                        child: Text(
                      "Smart, Gorgeous & Fashionable ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Color(
                          0xffECECEC,
                        ),
                      ),
                    )),
                    Center(
                        child: Text(
                      "Collection Explor Now",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Color(
                          0xffECECEC,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .18,
                    left: MediaQuery.of(context).size.width * .74),
                child: const Image(
                    image: AssetImage(
                  'images/misc.png',
                )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.32),
                child: const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      'images/sneakers.png',
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .55,
                      right: MediaQuery.of(context).size.width * .1),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Image(
                          image: AssetImage(
                        'images/Vector2.png',
                      )))),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .79),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 42, height: 5, color: const Color(0xffFFB21A)),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                          width: 28, height: 5, color: const Color(0xffFFB21A)),
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
                      top: MediaQuery.of(context).size.height * .18,
                      right: MediaQuery.of(context).size.width * .7),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Image(
                          image: AssetImage(
                        'images/misc2.png',
                      )))),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .90),
                child: RoundButtonOne(onpress: () {}, title: 'Next'),
              ),
            ],
          )),
    );
  }
}
