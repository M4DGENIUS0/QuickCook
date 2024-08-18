import 'package:flutter/material.dart';

class Listcard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback tap;
  const Listcard({super.key, required this.title, required this.image, required this.tap});

  @override
  Widget build(BuildContext context) {
    const placeholderImage = 'https://via.placeholder.com/150';
    final validImageUrl =
        image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
            ? image
            : placeholderImage;
    return Card(
      color: Colors.white,
    
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(width: 1, color: Color.fromRGBO(12, 154, 97, 1))),
      child: ListTile(
        onTap: tap,
        leading: Image(
            image: NetworkImage(validImageUrl),
            height: 75,
            width: 70,
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Color.fromRGBO(12, 154, 97, 1),
                fontSize: 15,
                
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold),
          ),
        
      ),
    );
  }
}
