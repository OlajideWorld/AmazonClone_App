import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/belowappBar.dart';
import 'package:amazon_clone/Widgets/orders.dart';
import 'package:amazon_clone/Widgets/topButton.dart';
import 'package:amazon_clone/utils/addspace.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/amazon.png',
                      height: 45,
                      width: 120,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search)
                    ]),
                  )
                ]),
            elevation: 0,
          ),
        ),
        body: Column(children: const [
          BelowAppBAr(),
          SizedBox(height: 10),
          TopButton(),
          Orders()
        ]));
  }
}
