import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/locationbelow.dart';
import 'package:amazon_clone/Widgets/serchitems.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String SearchedProducts;
  const SearchScreen({super.key, required this.SearchedProducts});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> products =
      List<Map<String, dynamic>>.empty(growable: true);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: GlobalVariables.appBarGradient)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          hintText: "Search Amazon.in",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1))),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(children: [
        const LocationAddress(),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return SearchedItems(
                    products: products[index],
                  );
                }))
      ]),
    );
  }
}
