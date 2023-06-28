import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final VoidCallback onTap;

  const AppButtons(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.text,
      required this.borderColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 50,
        // height: MediaQuery.of(context).size.height / 18,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
