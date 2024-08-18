import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCards extends StatelessWidget {
  
  const ShimmerCards(
      {super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeShimmer(
          radius: 10,
          width: 200, height: 150, highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
        SizedBox(
          height: 10,
        ),
        FadeShimmer(width: 80, height: 10,
         highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
      ],
    );
  }
}
