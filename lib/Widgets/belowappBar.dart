import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:flutter/material.dart';

class BelowAppBAr extends StatelessWidget {
  const BelowAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right : 10, bottom: 10),
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: Row(
        children: [
          RichText(
              text: const TextSpan(
                  text: 'Hello, ',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                  children: [
                TextSpan(
                    text: "Admin",
                    style: TextStyle(fontSize: 22, color: Colors.black))
              ])),
        ],
      ),
    );
  }
}
