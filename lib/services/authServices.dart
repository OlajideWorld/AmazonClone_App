import 'dart:convert';

import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/getxsnackbar.dart';
import 'package:amazon_clone/Widgets/snackBar.dart';
import 'package:amazon_clone/constants/httpresponse.dart';
import 'package:amazon_clone/models/usermodel.dart';
import 'package:amazon_clone/routes/routes.dart';
import 'package:amazon_clone/services/apicachemanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthServices {
  static var client = http.Client();

  void signUp(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(
          id: "",
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      // var Url = Uri.parse('$uri/api/v1/auth/signup');
      // Map<String, String> requestHeaders = {
      //   'Content-Type': 'appication/json; charset=UTF-8'
      // };

      http.Response response = await http.post(
          Uri.parse('$uri/api/v1/auth/signup'),
          headers: <String, String>{'Content-Type': 'appication/json'},
          body: user.toJson());
      debugPrint(response.body);
      httpHandler(
          response: response,
          onSuccess: () {
            snackBar(
                context: context,
                text: "Account Created Login with the same Credentials");
          },
          context: context);
    } catch (e) {
      getErrorSnackBar(e.toString());
    }
  }

  void signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(
          Uri.parse("$uri/api/v1/auth/signin"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode({"email": email, "password": password}));

      httpHandler(
          response: response,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString("x-auth-token", jsonDecode(response.body)['token']);
            Get.offAllNamed(Routes.HomeScreen);
          },
          context: context);
    } catch (e) {
      getErrorSnackBar(jsonDecode(e.toString()));
    }
  }

  void getUserData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('x-auth-token');

    if (token == null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("x-auth-token", '');
    }

    http.Response tokenRes = await http
        .post(Uri.parse('$uri/api/v1/auth/token'), headers: <String, String>{
      'Content-Type': "application/json; charset=UTF-8",
      "Authorization": "Bearer $token"
    });

    var res = jsonDecode(tokenRes.body);

    if (res == true) {
      http.Response response = await http
          .get(Uri.parse('$uri/api/v1/amazon/'), headers: <String, String>{
        'Content-Type': "application'/json; charset=UTF-8",
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        ApiCacheManager().storeUserData(user: data['data']);
      }
    }
  }
}
