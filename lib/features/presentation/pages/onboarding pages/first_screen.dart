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
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 350,
              child: LottieBuilder.asset(
                'assets/animation/thinking.json',
              ),
            ),
            SizedBox(
              height: 90,
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
                    TextSpan(text: "Find "),
                    TextSpan(text: "Every\n"),
                    TextSpan(
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
