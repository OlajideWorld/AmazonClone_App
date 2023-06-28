import 'package:amazon_clone/models/productsModel.dart';
import 'package:flutter/material.dart';

class SearchedItems extends StatefulWidget {
  final Map<String, dynamic> products;

  const SearchedItems({
    super.key,
    required this.products,
  });

  @override
  State<SearchedItems> createState() => _SearchedItemsState();
}

class _SearchedItemsState extends State<SearchedItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Image.network(
                widget.products['images'][0],
                fit: BoxFit.fitHeight,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.products['name'],
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      widget.products['description'],
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
