import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalImage extends StatefulWidget {
  const CarousalImage({super.key});

  @override
  State<CarousalImage> createState() => _CarousalImageState();
}

class _CarousalImageState extends State<CarousalImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((image) {
          return Builder(
              builder: (BuildContext context) => Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 200,
                  ));
        }).toList(),
        options: CarouselOptions(viewportFraction: 1, height: 200));
  }
}
