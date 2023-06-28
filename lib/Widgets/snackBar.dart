import 'package:flutter/material.dart';

snackBar({required BuildContext context, required String text}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
