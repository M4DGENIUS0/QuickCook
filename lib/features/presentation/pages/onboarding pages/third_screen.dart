import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Third_Onboard extends StatefulWidget {
  const Third_Onboard({super.key});

  @override
  State<Third_Onboard> createState() => _Third_OnboardState();
}

class _Third_OnboardState extends State<Third_Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
          ),
          SizedBox(
            width: 350,
            height: 350,
            child: LottieBuilder.asset(
              'assets/animation/taste.json',
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 330,
            child: Text.rich(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PaytoneOne',
                    fontSize: 35),
                strutStyle: StrutStyle(),
                TextSpan(children: [
                  TextSpan(text: "Noting Beats\n"),
                  TextSpan(
                      text: "The First bite\n",
                      style:
                          TextStyle(color: Color.fromRGBO(255, 190, 157, 1))),
                  TextSpan(
                      text:
                          "A fabulous meal can make a differnce By turning the fisrt bite into a memorable moment",
                      style: TextStyle(fontSize: 15, color: Colors.grey[850]))
                ])),
          )
        ],
      ),
    ));
  }
}
