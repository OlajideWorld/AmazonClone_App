import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Screens/adminHome.dart';
import 'package:amazon_clone/models/productsModel.dart';
import 'package:amazon_clone/services/homeServices.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String category;
  const Category({super.key, required this.category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, dynamic>> products =
      List<Map<String, dynamic>>.empty(growable: true);

  HomeServices homeServices = HomeServices();

  List<Products>? productList;

  @override
  void initState() {
    super.initState();
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
    // fetchProducts();
  }

  // fetchProducts() async {
  //   productList = await homeServices.fetchProductcategory(
  //       categoryProduct: widget.category, context: context);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            centerTitle: true,
          )),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Keep on Shopping for Category ${widget.category}',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            products[index]['images'][0],
                            fit: BoxFit.cover,
                            width: 70,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(top: 5, right: 15, left: 0),
                      child: Text(
                        products[index]['name'],
                        maxLines: 1,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ],
                );
              }),
        )
      ]),
    );
  }
}
