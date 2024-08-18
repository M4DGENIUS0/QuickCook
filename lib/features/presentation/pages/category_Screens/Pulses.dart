import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/assets.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/gridSwitch.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/GridView_Display.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/ListView_Widget/ListDisplay.dart';
import 'package:provider/provider.dart';

class PulseScreen extends StatefulWidget {
  const PulseScreen({super.key});

  @override
  State<PulseScreen> createState() => _PulseScreenState();
}

class _PulseScreenState extends State<PulseScreen> {
  int selectedQuantity = 4;

  @override
  Widget build(BuildContext context) {
        final prov = Provider.of<GridSwitch>(context);

    return Scaffold(
      floatingActionButton: prov.selectindex.length > 0 ? FloatingActionButton(onPressed: (){
        // Navigator.of(context).pop();
         void onConfirm(BuildContext context, int selectedQuantity) {
                    Navigator.pop(context, selectedQuantity);
                  }

                  onConfirm(context, selectedQuantity);
        print(prov.selectindex);
      }, backgroundColor: assets.green, child: Icon(Icons.check, color:  Colors.white),) :  null,
      appBar: AppBar(

        actions: 
        
        [
          InkWell(
          onTap: (){
            prov.toggle();
          },
          child: Icon(prov.isGridView ? Icons.grid_view_rounded : Icons.list_rounded)),
          const SizedBox(width: 10,),
          
          ],
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          HeroIcons.arrow_left,
        ),
      )),
      body: prov.isGridView ? const GridviewDisplay(category: '/api/pulses', Location: 'Pulses', ) : const ListviewDisplay(category: '/api/pulses',) 
    );
  }
}
