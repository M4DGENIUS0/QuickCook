import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/profile/Profile_Dashboard.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Search.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Gemini_Response/recipe_Page.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/assets.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Services/prompt_Service/Prompt_Service.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/home_provider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:ingredient_cooker/features/presentation/widgets/CategoryGrid.dart';
import 'package:provider/provider.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Home extends StatefulWidget {
  final String location;
  const Home({super.key, required this.location});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double _height = 30;
  final double _width = 90;
  bool Ticker = false;
  String value_here = '';

  @override
  Widget build(BuildContext context) {
    final homeprov = Provider.of<HomeProvider>(context);
    final responses = Provider.of<UploadDataServer>(context);
    return  Scaffold(
        body: OverlayLoaderWithAppIcon(
        isLoading: homeprov.recipe_load,
        appIconSize: 50,
        circularProgressColor: assets.green,
        isProgressEnabled: true,
        borderRadius: 15,
        overlayBackgroundColor: Colors.white,
// overlayOpacity: 10.0,
        appIcon:  Lottie.asset('assets/animation/loading.json', width: 300, height: 300),
          child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Hello, Ahmad\n",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: 'Comfortaa')),
                    TextSpan(
                        text: "What would you like\nto cook today?",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold))
                  ])),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                const Profile_Dashboard(),
                          ));
                    },
                    child: const Hero(
                      tag: 'profile',
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/me.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Hero(
              tag: 'search',
              child: SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) =>
                                const Search(),
                          ));
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(EvaIcons.camera)),
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(12, 154, 97, 1)),
                            borderRadius: BorderRadius.circular(32)),
                        prefixIcon: const Icon(EvaIcons.search),
                        hintText: "Search any Ingredients",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(12, 154, 97, 1)),
                            borderRadius: BorderRadius.circular(32))),
                  )),
            ),
            const CategoryGrid(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  autofocus: false,
                  borderRadius: BorderRadius.circular(18),
                  onLongPress: () {
                    var snackBar = const SnackBar(
                      content: Text('Make Recipe for Number of peoples!'),
                    );
          
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Icon(
                    Icons.account_circle,
                    // color: Colors.black,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: const Color.fromRGBO(12, 154, 97, 1)),
                      borderRadius: BorderRadius.circular(35)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(AntDesign.minus_outline),
                        onPressed: () {
                          homeprov.subtract();
                        },
                      ),
                      Text(homeprov.valchange.toString()),
                      IconButton(
                          onPressed: () {
                            homeprov.add();
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRadioButton(
              absoluteZeroSpacing: false,
              customShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              unSelectedBorderColor: assets.green,
              enableShape: true,
              elevation: 5,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: [
                '15 minute',
                '30 minute',
                '60 minute',
              ],
              buttonValues: [
                "15",
                "30",
                "60",
              ],
              buttonTextStyle: ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: assets.green,
                  textStyle: TextStyle(fontSize: 16)),
              radioButtonValue: (value) {
                value_here = value;
                print(value);
              },
              selectedColor: assets.green,
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    homeprov.yes();
                    Prompt_Service().CallPromptService(context, widget.location);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(12, 154, 97, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: homeprov.recipe_load
                      ? Center(
                        child: JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          milliseconds: 120,
                          dotSpacing: 3,
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                      )
                      : Text(
                          "Show Me Recipe",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Comfortaa',
                              fontSize: 15),
                        )),
            )
          ],
                ),
              ),
        ));
  }
}
