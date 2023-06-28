import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Screens/adminHome.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentPage = 0;

  List<Widget> pagesList = [
    const HomeScreeAdmin(),
    const Center(
      child: Text('Welcome 2'),
    ),
    const Center(
      child: Text('Welcome 3'),
    )
  ];

  void updatePage(int index) {
    return setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _currentPage == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5)),
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    color: _currentPage == 0
                        ? GlobalVariables.selectedNavBarColor
                        : Colors.black,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _currentPage == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5)),
                  ),
                  child: Icon(
                    Icons.analytics_outlined,
                    color: _currentPage == 1
                        ? GlobalVariables.selectedNavBarColor
                        : Colors.black,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _currentPage == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5)),
                  ),
                  child: Icon(
                    Icons.all_inbox_outlined,
                    color: _currentPage == 2
                        ? GlobalVariables.selectedNavBarColor
                        : Colors.black,
                  ),
                ),
                label: "")
          ]),
    );
  }
}
