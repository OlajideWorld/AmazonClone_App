import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text(
            'Deal of the day',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1597673030062-0a0f1a801a31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG1hY2Jvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          fit: BoxFit.fitHeight,
          height: 235,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            '\$ 500',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, right: 40),
          child: const Text(
            'Apple MacBook Pro 8gb,ssd,250 rom,Nice body with Slick Touch',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Image.network(
              'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFjYm9va3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.fitWidth,
              width: 100,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1484807352052-23338990c6c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFjYm9va3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.fitWidth,
              width: 100,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1616400619175-5beda3a17896?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1hY2Jvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.fitWidth,
              width: 100,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1629131726692-1accd0c53ce0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hY2Jvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.fitWidth,
              width: 100,
            ),
          ]),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: const Text(
            'See all Deals',
            style: TextStyle(color: Colors.green),
          ),
        )
      ]),
    );
  }
}
