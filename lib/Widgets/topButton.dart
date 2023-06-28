import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/actionButtuonHome.dart';
import 'package:amazon_clone/Widgets/appbutton.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ActionButton(
                text: "Your Orders",
                onTap: () {},
              ),
            ),
            Expanded(
              child: ActionButton(
                text: "Turn Seller",
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ActionButton(
                text: "Log Out",
                onTap: () {},
              ),
            ),
            Expanded(
              child: ActionButton(
                text: "Your WishListr",
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
