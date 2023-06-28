import 'dart:io';

import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/appbutton.dart';
import 'package:amazon_clone/Widgets/getxsnackbar.dart';
import 'package:amazon_clone/Widgets/input-textfield.dart';
import 'package:amazon_clone/services/adminServices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/sizes.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productQuantity = TextEditingController();
  final GlobalKey<FormState> addglobalKey = GlobalKey<FormState>();
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    // productName.dispose();
    // productDescription.dispose();
    // productPrice.dispose();
    // productQuantity.dispose();
  }

  List<String> productCategory = [
    'Mobiles',
    "Essentials",
    'Appliances',
    "Books",
    "Fashion"
  ];

  List<File> images = [];

  String currentCategory = 'Mobiles';

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void addProducts() async {
    if (addglobalKey.currentState!.validate() && images.isNotEmpty) {
    //  adminServices.setProducts(
    //       context: context,
    //       name: productName.text,
    //       description: productDescription.text,
    //       price: double.parse(productPrice.text),
    //       quantity: double.parse(productQuantity.text),
    //       category: currentCategory,
    //       images: images);

      debugPrint(
          '${productName.text} + ${productDescription.text} + ${productPrice.text} + ${productQuantity.text} + $currentCategory');
    }
    Get.back();
    getSuccessSnackBar("Product Added Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          centerTitle: true,
          title: const Text(
            'Add Products',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: addglobalKey,
            child: Column(children: [
              const SizedBox(height: 20),
              images.isNotEmpty
                  ? GestureDetector(
                      onDoubleTap: selectImages,
                      child: CarouselSlider(
                          items: images.map((image) {
                            return Builder(
                                builder: (BuildContext context) => Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ));
                          }).toList(),
                          options: CarouselOptions(
                              viewportFraction: 1, height: 200)),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                          dashPattern: const [10, 4],
                          radius: const Radius.circular(10),
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: 150,
                            width: double.infinity,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Select Product Image',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  )
                                ]),
                          )),
                    ),
              const SizedBox(height: 20),
              InputTextField(
                hintText: 'Product Name',
                obscureText: false,
                controller: productName,
                textInputAction: true,
              ),
              InputTextField(
                hintText: 'Description',
                obscureText: false,
                controller: productDescription,
                maxlines: 7,
                textInputAction: true,
              ),
              InputTextField(
                hintText: 'Price',
                obscureText: false,
                controller: productPrice,
                textInputAction: true,
              ),
              InputTextField(
                hintText: 'Quantity',
                obscureText: false,
                controller: productQuantity,
                textInputAction: true,
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: currentCategory,
                    items: productCategory.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        currentCategory = val!;
                      });
                    },
                  )),
              const SizedBox(height: 10),
              AppButtons(
                  textColor: GlobalVariables.backgroundColor,
                  backgroundColor: GlobalVariables.secondaryColor,
                  text: "Sell",
                  borderColor: GlobalVariables.secondaryColor,
                  onTap: addProducts)
            ]),
          ),
        ),
      ),
    );
  }
}
