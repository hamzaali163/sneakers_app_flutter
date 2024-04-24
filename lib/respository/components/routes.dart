import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/view/auth/forgot_password.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/auth/sign_up_screen.dart';
import 'package:ecommerce_app/view/home/bottom_nav_bar.dart';
import 'package:ecommerce_app/view/home/cart_screen.dart';
import 'package:ecommerce_app/view/home/checkout_screen.dart';
import 'package:ecommerce_app/view/home/favourites_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/home/notification_screen.dart';
import 'package:ecommerce_app/view/home/profile.dart';
import 'package:ecommerce_app/view/home/show_all_products.dart';
import 'package:ecommerce_app/view/splash_screen/page_view.dart';
import 'package:ecommerce_app/view/splash_screen/screen_one.dart';
import 'package:ecommerce_app/view/splash_screen/screen_three.dart';
import 'package:ecommerce_app/view/splash_screen/screentwo.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateroutes(RouteSettings route) {
    switch (route.name) {
      case RouteNames.screenOne:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ScreenOne());

      case RouteNames.screenTwo:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ScreenTwo());

      case RouteNames.screenThree:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ScreenThree());

      case RouteNames.pageViewScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PageViewScreen());

      case RouteNames.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RouteNames.signUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

      case RouteNames.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPasswordScreen());

      case RouteNames.navbarscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const BottomNavigationBarScreen());

      case RouteNames.homescreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RouteNames.favcreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavouriteScreen());

      case RouteNames.cartscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartScreen());

      case RouteNames.notificationscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationScreen());

      case RouteNames.profilescreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserProfile());

      case RouteNames.productsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ShowProducts());

      case RouteNames.checkOutScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CheckOutScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Column(
              children: [
                Center(
                  child: Text('error, no screen found'),
                ),
              ],
            ),
          );
        });
    }
  }
}
