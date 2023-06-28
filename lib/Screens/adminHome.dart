import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/singleproducts.dart';
import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/models/productsModel.dart';
import 'package:amazon_clone/routes/routes.dart';
import 'package:amazon_clone/services/adminServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreeAdmin extends StatefulWidget {
  const HomeScreeAdmin({super.key});

  @override
  State<HomeScreeAdmin> createState() => _HomeScreeAdminState();
}

class _HomeScreeAdminState extends State<HomeScreeAdmin> {
  List<Map<String, dynamic>> products =
      List<Map<String, dynamic>>.empty(growable: true);

  AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    // fetchProducts();
    products = [
      {
        "name": 'Iphone',
        "description": "An Amazing phone for the use of many people",
        "price": double.parse("500"),
        "quantity": double.parse('23'),
        "category": "Mobiles",
        "images": [
          'https://images.unsplash.com/photo-1484807352052-23338990c6c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFjYm9va3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        ]
      },
      {
        "name": 'Macbook',
        "description": "A great Laptop that last long in use,it is good",
        "price": double.parse("2000"),
        "quantity": double.parse('40'),
        "category": "Appliances",
        "images": [
          'https://media.istockphoto.com/id/1359180038/photo/wristwatch.jpg?b=1&s=170667a&w=0&k=20&c=IfgsIwH-jjyvuiCPs0PEjIczFqWN3-RC63Z3LoMFmFM=',
        ]
      },
      {
        "name": 'Macbook',
        "description": "A great Laptop that last long in use,it is good",
        "price": double.parse("2000"),
        "quantity": double.parse('40'),
        "category": "Appliances",
        "images": [
          'https://images.unsplash.com/photo-1663314326587-1c78fe2b7d5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGlwaG9uZSUyMDE0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        ]
      },
      {
        "name": 'Macbook',
        "description": "A great Laptop that last long in use,it is good",
        "price": double.parse("2000"),
        "quantity": double.parse('40'),
        "category": "Appliances",
        "images": [
          'https://images.unsplash.com/photo-1587749090881-1ea18126ab3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5kcm9pZCUyMHBob25lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        ]
      },
      {
        "name": 'Macbook',
        "description": "A great Laptop that last long in use,it is good",
        "price": double.parse("2000"),
        "quantity": double.parse('40'),
        "category": "Appliances",
        "images": [
          'https://images.unsplash.com/photo-1618410320928-25228d811631?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aHAlMjBsYXB0b3B8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
        ]
      },
    ];
  }

  // fetchProducts() async {
  //   products = await adminServices.fetchProducts(context);
  //   setState(() {});
  // }

  // void deleteProduct(Products product, int index) async {
  //   adminServices.deleteProduct(
  //       products: product,
  //       onSuccess: () {
  //         products.removeAt(index);
  //         setState(() {});
  //       },
  //       context: context);
  // }

  void deleteProduct(int index, products) async {
    products.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return
        // return products == null
        //     ? const Loader() :
        Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/amazon.png',
                        height: 45,
                        color: Colors.black,
                        width: 120,
                      )),
                  const Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          )),
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProducts(image: products[index]['images'][0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        products[index]['description'],
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          deleteProduct(index, products[index]);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addProducts);
        },
        tooltip: "Add products",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
