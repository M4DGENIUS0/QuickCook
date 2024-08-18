import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/gridSwitch.dart';
import 'package:provider/provider.dart';

class RecipeGridcard extends StatelessWidget {
  final String title;
  final String Description;
  final String image;
  final VoidCallback tap;
  final Color cardColor;
  final Color textColor;
  final Color DescriptionColor;
  // final String value; 

  const RecipeGridcard({
    super.key,
    required this.title,
    required this.image,
    required this.tap, required this.cardColor, required this.textColor, required this.Description, required this.DescriptionColor,
    // required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const placeholderImage = 'https://via.placeholder.com/150';
    final validImageUrl =
        image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
            ? image
            : placeholderImage;
    final provi = Provider.of<GridSwitch>(context);

    return GestureDetector(
      onTap: tap,
      child: Card(
        color: cardColor,
        shape: const RoundedRectangleBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side:  BorderSide(width: 1, color: Color.fromRGBO(12, 154, 97, 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(validImageUrl),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              Description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: DescriptionColor,
                fontSize: 10,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
