// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class First_Onboard extends StatefulWidget {
  const First_Onboard({super.key});

  @override
  State<First_Onboard> createState() => _First_OnboardState();
}

class _First_OnboardState extends State<First_Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 350,
              child: LottieBuilder.asset(
                'assets/animation/thinking.json',
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              width: 330,
              child: Text.rich(
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'PaytoneOne',
                      fontSize: 35),
                  strutStyle: const StrutStyle(),
                  TextSpan(children: [
                    const TextSpan(text: "Find "),
                    const TextSpan(text: "Every\n"),
                    const TextSpan(
                        text: "Ingredients\n",
                        style:
                            TextStyle(color: Color.fromRGBO(252, 0, 139, 1))),
                    TextSpan(
                        text:
                            "Whether you prefer spicy, sweet, or savory\nWe have the ingredients to suit your mood",
                        style: TextStyle(fontSize: 15, color: Colors.grey[850]))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
