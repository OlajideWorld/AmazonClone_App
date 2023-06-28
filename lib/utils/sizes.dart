import 'dart:io';

import 'package:amazon_clone/utils/sizes-config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

double widthSize(double value) {
  double size = value / 4.14;
  return size * SizeConfig.widthMultiplier;
}

double heightSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.heightMultiplier;
}

double fontSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.textMultiplier;
}

String truncate(String text, {required int length}) {
  String omission = "....";
  if (text.length > length) {
    return text.replaceRange(length, text.length, omission);
  }
  return text;
}

Future<List<File>> pickImages() async {
    List<File> images = [];

    try {
      var files = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: true);

      if (files != null && files.files.isNotEmpty) {
        print(files.files.length);
        for (int i = 0; i < files.files.length; i++) {
          images.add(File(files.files[i].path!));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return images;
  }

