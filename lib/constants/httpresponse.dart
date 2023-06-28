import 'dart:convert';

import 'package:amazon_clone/Widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpHandler(
    {required http.Response response,
    required VoidCallback onSuccess,
    required BuildContext context}) {
  switch (response.statusCode) {
    case (200):
      onSuccess;
      break;
    case (400):
      snackBar(context: context, text: jsonDecode(response.body));
      break;
    case (500):
      snackBar(context: context, text: jsonDecode(response.body));
      break;
    default:
      snackBar(context: context, text: jsonDecode(response.body));
  }
}
