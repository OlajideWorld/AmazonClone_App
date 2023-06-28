import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Screens/accountScreen.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

import '../Screens/homeScreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPage = 0;
  double bottomBarWidth = 42;
  double barwidth = 5;

  List<Widget> screens = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Screen'),
    )
  ];

  void pages(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: pages,
        currentIndex: currentPage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: currentPage == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: barwidth))),
                child: const Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: currentPage == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: barwidth))),
                child: const Icon(Icons.person_outline),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: currentPage == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: barwidth))),
                child: badge.Badge(
                    elevation: 0,
                    badgeColor: Colors.white,
                    badgeContent: const Text('3'),
                    child: const Icon(Icons.shopping_cart_outlined)),
              ),
              label: ''),
        ],
      ),
    );
  }
}
