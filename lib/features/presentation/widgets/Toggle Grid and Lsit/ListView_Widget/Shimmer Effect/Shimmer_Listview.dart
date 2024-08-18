
import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/Shimmer%20Effect/Shimmer_Cards.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/ListView_Widget/Shimmer%20Effect/ShimmerListCards.dart';

class ShimmerListview extends StatefulWidget {
  const ShimmerListview({super.key});

  @override
  State<ShimmerListview> createState() => _ShimmerListviewState();
}

class _ShimmerListviewState extends State<ShimmerListview> {
  

  @override
  Widget build(BuildContext context) {
    
          return ListView.separated(
            itemCount: 4,

            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            
            physics: const NeverScrollableScrollPhysics(),
            
            itemBuilder: (context, index) {
             
              return  const ShimmerListCards();
            }, separatorBuilder: (BuildContext context, int index) => Divider(),
          );
        }
      }
