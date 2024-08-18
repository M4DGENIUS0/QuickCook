import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerListCards extends StatelessWidget {
  
  const ShimmerListCards(
      {super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FadeShimmer(
          radius: 10,
          width: 50, height: 50, highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
       
        FadeShimmer(width: 170, height: 10,
         highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
      ],
    );
  }
}
