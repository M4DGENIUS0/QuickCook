
import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/Shimmer%20Effect/Shimmer_Cards.dart';

class ShimmerGridview extends StatefulWidget {
  const ShimmerGridview({super.key});

  @override
  State<ShimmerGridview> createState() => _ShimmerGridviewState();
}

class _ShimmerGridviewState extends State<ShimmerGridview> {
  

  @override
  Widget build(BuildContext context) {
    
          return GridView.builder(
            itemCount: 4,

            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 30, top: 40, right: 10, left: 10),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4),
              mainAxisExtent: 256,
            ),
            itemBuilder: (context, index) {
             
              return  const ShimmerCards();
            },
          );
        }
      }
