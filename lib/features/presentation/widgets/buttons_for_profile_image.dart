import 'package:flutter/material.dart';

class Buttons_Image extends StatelessWidget {
  final IconData icon;
  final String title;
  const Buttons_Image({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(12, 154, 97, 1).withOpacity(0.1)),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
        )
      ],
    );
  }
}
