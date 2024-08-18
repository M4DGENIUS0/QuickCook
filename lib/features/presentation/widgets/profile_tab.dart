import 'package:flutter/material.dart';

class Profile_Tab extends StatelessWidget {
  final IconData? icon;
  final String Title;
  final VoidCallback ontap;
  final Color textcolors;
  const Profile_Tab(
      {super.key,
      this.icon,
      required this.Title,
      required this.ontap,
      required this.textcolors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onTap: ontap,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromRGBO(12, 154, 97, 1).withOpacity(0.1)),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
        ),
        title: Text(
          Title,
          style: TextStyle(color: textcolors, fontFamily: 'Comfortaa'),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
