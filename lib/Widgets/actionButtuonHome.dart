import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
          border:
              Border.all(color: GlobalVariables.backgroundColor, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: onTap,
        child: Text(text,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15)),
      ),
    );
  }
}
