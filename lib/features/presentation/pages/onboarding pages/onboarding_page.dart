// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/sign_up.dart';
import 'package:ingredient_cooker/features/presentation/pages/onboarding%20pages/first_screen.dart';
import 'package:ingredient_cooker/features/presentation/pages/onboarding%20pages/second_screen.dart';
import 'package:ingredient_cooker/features/presentation/pages/onboarding%20pages/third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  // Controller for page
  final PageController _controller = PageController();
  // to change button
  bool ChangeButton = false;
  // loading
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        physics: const PageScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            ChangeButton = (index == 2);
          });
        },
        controller: _controller,
        children: const [First_Onboard(), Sec_Onboard(), Third_Onboard()],
      ),
      // Dots indicator here
      Container(
          alignment: const Alignment(0, 0.70),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade900,
                dotColor: Colors.grey.shade300,
                dotHeight: 10.0,
                dotWidth: 10.0),
          )),
      Positioned(
        bottom: 40.0,
        left: 30.0,
        right: 30.0,
        child: SizedBox(
          height: 50,
          child: ChangeButton
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    setState(() {
                      loading = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sign_up(),
                          ));
                    });
                  },
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PaytoneOne',
                              fontSize: 18),
                        ))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PaytoneOne',
                        fontSize: 18),
                  )),
        ),
      )
    ]));
  }
}
