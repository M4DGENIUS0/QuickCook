import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Services/API_Services.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/gridSwitch.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/GridCards.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/Shimmer%20Effect/Shimmer_Gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridviewDisplay extends StatefulWidget {
  const GridviewDisplay({super.key, required this.category, required this.Location});
  final String category;
  final String Location;

  @override
  State<GridviewDisplay> createState() => _GridviewDisplayState();
}

class _GridviewDisplayState extends State<GridviewDisplay> {
  late Future<void> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _fetchData();
  }

  Future<void> _fetchData() async {
    final provider = Provider.of<APIService>(context, listen: false);
    await provider.callAPI(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.uid;
    final provider = Provider.of<APIService>(context);
    final prov = Provider.of<GridSwitch>(context);
    final uploadtoServer = Provider.of<UploadDataServer>(context);

    final items = provider.data;

    return FutureBuilder(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerGridview();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = prov.isSelected(item['title']);
              return FutureBuilder<bool>(
                future: uploadtoServer.containsData(widget.Location, item['id'].toString()),
                builder: (context, snapshot) {
                  final bool exists = snapshot.data ?? false;
                  return Gridcard(
                    title: item['title'],
                    image: 'https://ingredients-api-production.up.railway.app/data/${item['image']}',
                    tap: () async {
                      prov.onCardTap(item['title']);
                      if (exists) {
                        await uploadtoServer.removeData(widget.Location, item['id'].toString());
                      } else {
                        await uploadtoServer.uploadData(item['title'], widget.Location, item['id'].toString());
                      }
                      
                      print("now: ${await uploadtoServer.getLengthFromDatabase('$user/Ingredients/${widget.Location}')}");
                    },
                    cardColor: exists ? const Color.fromRGBO(12, 154, 97, 1) : Colors.white,
                    textColor: exists ? Colors.white : const Color.fromRGBO(12, 154, 97, 1),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
