// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sec_Onboard extends StatefulWidget {
  const Sec_Onboard({super.key});

  @override
  State<Sec_Onboard> createState() => _Sec_OnboardState();
}

class _Sec_OnboardState extends State<Sec_Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: 350,
            height: 350,
            child: LottieBuilder.asset(
              'assets/animation/mixing.json',
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            width: 330,
            child: Text.rich(
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'PaytoneOne',
                    fontSize: 35),
                strutStyle: const StrutStyle(),
                TextSpan(children: [
                  const TextSpan(text: "Combine it\n"),
                  const TextSpan(
                      text: "Enjoy\n",
                      style:
                          TextStyle(color: Color.fromRGBO(141, 227, 127, 1))),
                  TextSpan(
                      text:
                          "Simply input your ingredients, and \nThe app generates Personalized recipes and Cooking instructions instantly",
                      style: TextStyle(fontSize: 15, color: Colors.grey[850]))
                ])),
          )
        ],
      ),
    ));
  }
}
