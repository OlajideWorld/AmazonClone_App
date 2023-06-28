import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:flutter/material.dart';

class LocationAddress extends StatefulWidget {
  const LocationAddress({super.key});

  @override
  State<LocationAddress> createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 0.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(
            225,
            114,
            226,
            221,
          ),
          Color.fromARGB(225, 162, 236, 233)
        ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
            Expanded(
              child: Text(
                'Delivery to Admin-101 Fake, Wall Street,Keeping',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, top: 2),
              child: Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
