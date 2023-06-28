import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconLoader extends StatefulWidget {
  const IconLoader({super.key});

  @override
  State<IconLoader> createState() => _IconLoaderState();
}

class _IconLoaderState extends State<IconLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: ListView.builder(
          itemExtent: 75,
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => Category(
                    category: GlobalVariables.categoryImages[index]['title']!));
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        GlobalVariables.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            );
          })),
    );
  }
}
