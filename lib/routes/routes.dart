import 'package:amazon_clone/Screens/adminScreen.dart';
import 'package:amazon_clone/Screens/authScreen.dart';
import 'package:amazon_clone/Screens/accountScreen.dart';
import 'package:amazon_clone/Widgets/addproducts.dart';
import 'package:amazon_clone/Widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/homeScreen.dart';

class Routes {
  static const AuthScreen = "/authscreen";
  static const AdminScreen = '/adminscreen';
  static const AccountScreen = '/accountscreen';
  static const HomeScreen = '/homescreen';
  static const bottomBar = '/bottombar';
  static const addProducts = '/addproducts';
  static const m = '/months';
  static const t = '/manuals';
  static const b = '/events';
}

class Pages {
  // static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: Routes.AuthScreen,
      page: () => const AuthScreen(),
      //  binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.AdminScreen,
      page: () => const AdminScreen(),
      //  binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HomeScreen,
      page: () => const HomeScreen(),
      //  // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.addProducts,
      page: () => const AddProductScreen(),
      //  // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.AccountScreen,
      page: () => const AccountScreen(),
      //binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.bottomBar,
      page: () => const BottomBar(),
      //  // binding: AuthBinding(),
    ),
  ];
}
