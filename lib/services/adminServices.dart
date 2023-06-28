import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/getxsnackbar.dart';
import 'package:amazon_clone/constants/httpresponse.dart';
import 'package:amazon_clone/models/productsModel.dart';
import 'package:amazon_clone/services/apicachemanager.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  void setProducts({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final cache = await ApiCacheManager().getUserCredentials();

    try {
      final cloudinary = CloudinaryPublic('dm4eqhtyx', "hxazz7ky");
      List<String> imagesUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imagesUrl.add(res.secureUrl);
      }

      print(imagesUrl);
      Products products = Products(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imagesUrl);

      http.Response res =
          await http.post(Uri.parse('$uri/amazon/admin/add-products'),
              headers: {
                "Content-Type": "application/json; charset=UTF-8",
                "Authorization": "Bearer ${cache!.token}"
              },
              body: products.toJson());

      httpHandler(
          response: res,
          onSuccess: () {
            getSuccessSnackBar("Product Added Successfuly");
            Get.back();
          },
          context: context);
    } catch (e) {
      getErrorSnackBar(e.toString());
    }
  }

  Future<List<Products>> fetchProducts(BuildContext context) async {
    final cache = await ApiCacheManager().getUserCredentials();
    List<Products> productsList = [];

    try {
      http.Response res = await http
          .get(Uri.parse('$uri/amazon/admin/get-products'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${cache!.token}"
      });

      httpHandler(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productsList.add(
                Products.fromJson(
                  json.encode(json.decode(res.body)[i]),
                ),
              );
            }
          },
          context: context);
    } catch (e) {
      getErrorSnackBar(e.toString());
    }
    return productsList;
  }

  void deleteProduct(
      {required Products products,
      required VoidCallback onSuccess,
      required BuildContext context}) async {
    var cache = await ApiCacheManager().getUserCredentials();

    http.Response res = await http.delete(
        Uri.parse('$uri/admin/delete-products/${products.id}'),
        headers: {
          'Content-Type': "application/json",
          "Authorization": "Bearer ${cache!.token}"
        });

    httpHandler(
        response: res,
        onSuccess: () {
          onSuccess();
        },
        context: context);
  }
}
