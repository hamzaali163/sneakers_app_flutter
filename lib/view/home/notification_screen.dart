import 'package:ecommerce_app/model/product_list.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff7f7f9),
        appBar: AppBar(
          backgroundColor: const Color(0xfff7f7f9),
          title: const Text('Notifications'),
          titleTextStyle: TextStyling.apptitle,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.navbarscreen);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                height: 135,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(
                              ProductList().itemlist[4]['imagelink']),
                          height: 70,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We have New',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const Text(
                              'Products With Offers',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  r'$' + ProductList().itemlist[4]['unitprice'],
                                  style: const TextStyle(
                                      fontFamily: 'Poppins Medium',
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 135,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(
                              ProductList().itemlist[6]['imagelink']),
                          height: 70,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We have New',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const Text(
                              'Products With Offers',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  r'$' + ProductList().itemlist[6]['unitprice'],
                                  style: const TextStyle(
                                      fontFamily: 'Poppins Medium',
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 135,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(
                              ProductList().itemlist[7]['imagelink']),
                          height: 70,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We have New',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const Text(
                              'Products With Offers',
                              style: TextStyle(
                                  color: AppColor.backgroundColor,
                                  fontFamily: 'Raleway-Medium',
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  r'$' + ProductList().itemlist[7]['unitprice'],
                                  style: const TextStyle(
                                      fontFamily: 'Poppins Medium',
                                      fontSize: 14),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
