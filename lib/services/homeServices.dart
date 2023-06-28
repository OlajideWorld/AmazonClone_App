import 'dart:convert';

import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/snackBar.dart';
import 'package:amazon_clone/constants/httpresponse.dart';
import 'package:amazon_clone/models/productsModel.dart';
import 'package:amazon_clone/services/apicachemanager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Products>> fetchProductcategory({
    required String categoryProduct,
    required BuildContext context,
  }) async {
    var cache = await ApiCacheManager().getUserCredentials();
    List<Products> products = [];

    try {
      http.Response res = await http.get(
          Uri.parse("$uri/amazon/user/products?category=$categoryProduct"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${cache!.token}"
          });

      httpHandler(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products
                  .add(Products.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          },
          context: context);
    } catch (e) {
      snackBar(context: context, text: e.toString());
    }
    return products;
  }

  Future<List<Products>> fetchSearchedproducts({
    required String categoryProduct,
    required BuildContext context,
  }) async {
    var cache = await ApiCacheManager().getUserCredentials();
    List<Products> products = [];

    try {
      http.Response res = await http.get(
          Uri.parse("$uri/amazon/user/products/$categoryProduct"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${cache!.token}"
          });

      httpHandler(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products
                  .add(Products.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          },
          context: context);
    } catch (e) {
      snackBar(context: context, text: e.toString());
    }
    return products;
  }
}
