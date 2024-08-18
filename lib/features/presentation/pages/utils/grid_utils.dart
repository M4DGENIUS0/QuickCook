
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Home.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/assets.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
import 'package:provider/provider.dart';

class ingredients {
  final String name;
  final TextStyle styletext;
  final Image image;
  // final String value;
  // final VoidCallback tap;

  ingredients({
    required this.styletext,
    // required this.value,
    required this.name,
    required this.image,
    // required this.tap
  });
}

List<ingredients> ingredients_list = <ingredients>[
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',

    name: 'Dairy',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Dairy),
    // tap: () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => DairyScreen()));
    // }
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Fruit',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Fruit),
    // tap: (){}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Meat',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Meat),
    // tap: () {}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Veggies',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Veggies),
    // tap: () {}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length}',
    name: 'Pulses',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Pulses),
    // tap: () {}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Spices',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Spices),
    // tap: () {}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Dry Nuts',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Dry_Nuts),
    // tap: () {}
  ),
  ingredients(
    // value: '${GridSwitch().selectindex.length.toString() ?? null}',
    name: 'Wheat',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Wheat),
    // tap: () {}
  ),
  ingredients(
    // value: '',
    // ${GridSwitch().selectindex.length.toString() }
    name: 'Liquor',
    styletext: TextStyle(fontFamily: 'Comfortaa', color: Colors.grey),
    image: Image.asset(assets.Liquor),
    // tap: () {}
  ),
];

class Select_card extends StatelessWidget {
  Select_card({
    super.key,
    required this.Ingredients,
    required this.index,
    required this.location,
    required this.contentData, required this.Value,
    // required this.home,
  });
  final ingredients Ingredients;
  final int Value;
  final int index;
  final String location;
  final String contentData;

  @override
  Widget build(BuildContext context) {
    final uploadToServer = Provider.of<UploadDataServer>(context);

    return FutureBuilder(
      future: uploadToServer.getLengthFromDatabase(
          '${FirebaseAuth.instance.currentUser?.uid}/Ingredients/${location}/'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        Home(
          location: location,
        );
        final int length = snapshot.data ?? 0;
        //  print("data: " + length.toString());
        return Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Ingredients.image,
                    ),
                    SizedBox(height: 1),
                    Text(
                      Ingredients.name,
                      style: TextStyle(fontFamily: 'Comfortaa', fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            if (length > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: assets.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      length.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontSize: 9),
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
