import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/general_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection('User Data');

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.pageViewScreen);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
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
                  'Hello Again!',
                  style: TextStyling.headingstyle,
                ),
              ),
            )),
            const Center(
              child: Text(
                'Fill Your Details Or Continue With',
                style: TextStyling.subheading,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Center(
              child: Text(
                'Social Media',
                style: TextStyling.subheading,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenheight * 0.08, left: screenwidth * 0.08),
              child: const Text(
                'Email Address',
                style: TextStyling.formtextstyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.04,
                  right: screenwidth * 0.04,
                  top: screenheight * 0.01),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: 'xyz@gmail.com',
                    hintStyle: TextStyling.hinttext,
                    filled: true,
                    fillColor: const Color(0xffF7F7F9),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenheight * 0.03, left: screenwidth * 0.08),
              child: const Text(
                'Password',
                style: TextStyling.formtextstyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.04,
                  right: screenwidth * 0.04,
                  top: screenheight * 0.01),
              child: ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurepassword.value,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              _obsecurepassword.value =
                                  !_obsecurepassword.value;
                            },
                            child: _obsecurepassword.value
                                ? const Icon(Icons.visibility_off_sharp)
                                : const Icon(Icons.visibility),
                          ),
                          hintText: 'enter password',
                          hintStyle: TextStyling.hinttext,
                          filled: true,
                          fillColor: const Color(0xffF7F7F9),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12))),
                    );
                  }),
            ),
            Consumer<GeneralUtils>(builder: ((
              context,
              value1,
              child,
            ) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenheight * 0.038,
                  ),
                  child: RoundButtonTwo(
                      loading: value1.load,
                      onpress: () async {
                        value1.showloading(true);
                        await auth
                            .signInWithEmailAndPassword(
                                email: emailcontroller.text.toString(),
                                password: passwordcontroller.text.toString())
                            .then((value) {
                          value1.showsuccessflushbar(
                              'Successfully Logged IN', context);

                          Navigator.pushNamed(context, RouteNames.navbarscreen);
                          value1.showloading(false);
                        }).onError((error, stackTrace) {
                          value1.showerrorflushbar(error.toString(), context);
                          value1.showloading(false);
                        });
                      },
                      title: 'Sign In'),
                ),
              );
            })),

            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.forgotPasswordScreen);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 27),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: TextStyling.formtextstyle,
                    ),
                  ),
                )),
            //
            Consumer<GeneralUtils>(
              builder: (context, value1, child) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenheight * 0.03),
                    child: InkWell(
                        onTap: () {
                          value1.signInWithGoogle().then((value) {
                            db.doc(value1.id).set({
                              'id': value1.id,
                              'Full name': value1.name,
                              'Email': value1.email,
                              'image': '',
                            }).onError((error, stackTrace) => GeneralUtils()
                                .showerrorflushbar(error.toString(), context));
                            Navigator.pushNamed(
                                context, RouteNames.navbarscreen);
                          }).onError((error, stackTrace) {
                            value1.showerrorflushbar(error.toString(), context);
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 335,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xff000000),
                                        offset: Offset(
                                          1.0,
                                          1.0,
                                        ),
                                        blurRadius: 1,
                                        spreadRadius: 0.4)
                                  ],
                                  border: Border.all(
                                      color: const Color(0xff2B2B2B),
                                      width: 1.8),
                                  color: const Color(0xffF7F7F9),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: const Center(
                                child: Text(
                                  'Sign In With Google',
                                  style: TextStyle(
                                      fontFamily: 'Raleway-SemiBold',
                                      color: Color(0xff2B2B2B),
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 64, top: 10),
                              child: Image(
                                height: 30,
                                image: AssetImage(
                                  'images/googlelogo.png',
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'New User?',
                    style: TextStyle(
                      fontFamily: 'Raleway-Medium',
                      fontSize: 16,
                      color: Color(
                        0xff6A6A6A,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUpScreen);
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                            fontFamily: 'Raleway-Medium',
                            fontSize: 16,
                            color: Color(
                              0xff1A1D1E,
                            ),
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
