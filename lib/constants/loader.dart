import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          // color: GlobalVariables.selectedNavBarColor,
          ),
    );
  }
}
