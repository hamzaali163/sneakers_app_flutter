import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/fav_provider.dart';
import 'package:ecommerce_app/view/home/cart_screen.dart';
import 'package:ecommerce_app/view/home/favourites_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/home/notification_screen.dart';
import 'package:ecommerce_app/view/home/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final screens = const [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    NotificationScreen(),
    UserProfile()
  ];
  final auth = FirebaseAuth.instance;
  int itemindex = 0;
  final id = FirebaseAuth.instance.currentUser!.uid;
  final db = FirebaseFirestore.instance.collection("User Data");
  final db2 = FirebaseFirestore.instance.collection("Favourites");

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final favprovider = Provider.of<FavouriteProvider>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[itemindex],
        backgroundColor: const Color(0xffF7F7F9),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              itemindex = index;
            });
          },
          color: const Color(0xffFFFFFF),
          index: itemindex,
          buttonBackgroundColor: AppColor.backgroundColor,
          backgroundColor: const Color(0xffF7F7F9),
          items: [
            Image(
                image: const AssetImage('images/home.png'),
                color: itemindex == 0 ? Colors.white : Colors.black),
            Image(
                image: const AssetImage('images/heart.png'),
                color: itemindex == 1 ? Colors.white : Colors.black),
            Image(
                image: const AssetImage('images/cart.png'),
                color: itemindex == 2 ? Colors.white : Colors.black),
            Image(
                image: const AssetImage('images/notification.png'),
                color: itemindex == 3 ? Colors.white : Colors.black),
            Image(
                image: const AssetImage('images/profile.png'),
                color: itemindex == 4 ? Colors.white : Colors.black),
          ],
        ),
        drawer: SizedBox(
          height: screenheight,
          child: Drawer(
            // key: scaffoldKey,
            backgroundColor: const Color(0xff0D6EFD),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListView(
                children: [
                  SizedBox(
                    height: screenheight * 0.07,
                  ),
                  StreamBuilder(
                      stream: db.doc(id).snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        dynamic userData = snapshot.data?.data();

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.purple,
                          ));
                        } else if (snapshot.hasError) {
                          const Center(
                            child: Text("Error Occured"),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userData['image'] == null
                                  ? const CircleAvatar(
                                      radius: 96,
                                      child: Icon(
                                        Icons.person,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(userData['image']),
                                      radius: 96,
                                    ),
                              const SizedBox(
                                height: 20,
                              ),
                              userData['Full name'] == null
                                  ? Container()
                                  : Text(
                                      userData['Full name'].toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Raleway-Medium',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                            ],
                          ),
                        );
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/profile.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.profilescreen);
                    },
                  ),
                  //1
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/cart.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text('My Cart'),
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.cartscreen);
                    },
                  ),
                  //2
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/heart.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text('Favourites'),
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.favcreen);
                    },
                  ),
                  //3
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/orders.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text('Orders'),
                    onTap: () {},
                  ),
                  //4
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/notification.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text('Notifications'),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.notificationscreen);
                    },
                  ),
                  //5
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/settings.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text(
                      'Settings',
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    textColor: const Color(0xffFFFFFF),
                    leading: const Image(
                      image: AssetImage(
                        'images/signout.png',
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    title: const Text(
                      'Sign Out',
                    ),
                    onTap: () async {
                      await favprovider.deleteItems();
                      auth.signOut().then((value) {
                        Navigator.pushNamed(context, RouteNames.pageViewScreen);
                      });
                      GoogleSignIn().signOut().then((value) {
                        Navigator.pushNamed(context, RouteNames.pageViewScreen);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
