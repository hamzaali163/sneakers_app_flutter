import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/general_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.pageViewScreen);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ))),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                          padding: EdgeInsets.only(top: screenheight * .02),
                          child: const Text(
                            'Forgot Password',
                            style: TextStyling.headingstyle,
                          )))),
              const Center(
                  child: Text(
                'Enter Your Email Address To Reset',
                style: TextStyling.subheading,
              )),
              const SizedBox(
                height: 3,
              ),
              const Center(
                  child: Text(
                'Your Password',
                style: TextStyling.subheading,
              )),
              Padding(
                  padding: EdgeInsets.only(
                      left: screenwidth * 0.04,
                      right: screenwidth * 0.04,
                      top: screenheight * 0.05),
                  child: TextFormField(
                    controller: forgotpasswordcontroller,
                    decoration: InputDecoration(
                        hintText: 'xyz@gmail.com',
                        hintStyle: TextStyling.hinttext,
                        filled: true,
                        fillColor: const Color(0xffF7F7F9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                  )),
              Consumer<GeneralUtils>(builder: ((context, value1, child) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                    top: screenheight * 0.08,
                  ),
                  child: RoundButtonTwo(
                      loading: value1.load,
                      onpress: () async {
                        value1.showloading(true);
                        await auth
                            .sendPasswordResetEmail(
                                email: forgotpasswordcontroller.text.toString())
                            .then((value) {
                          value1.showloading(false);

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // ignore: sized_box_for_whitespace
                                  content: Container(
                                    height: 196,
                                    width: 335,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.backgroundColor),
                                          child: const Image(
                                              image: AssetImage(
                                                  'images/dialogbox.png')),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Center(
                                          child: Text(
                                            'Check Your Email',
                                            style: TextStyle(
                                              fontFamily: 'Raleway-Bold',
                                              fontSize: 16,
                                              color: Color(
                                                0xff2B2B2B,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                'We Have Sent Password Recovery',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13,
                                                  color: Color(
                                                    0xff707B81,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Center(
                                              child: Text(
                                                'Code On Your Email',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13,
                                                  color: Color(
                                                    0xff707B81,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }).onError((error, stackTrace) {
                          value1.showloading(false);

                          value1.showerrorflushbar(error.toString(), context);
                        });
                      },
                      title: 'Reset Password'),
                ));
              })),
            ])));
  }
}
