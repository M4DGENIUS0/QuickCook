import 'package:ingredient_cooker/features/presentation/state%20management/Services/API_Services.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/GridView_Widget/GridCards.dart';
import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/ListView_Widget/ListCard.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Toggle%20Grid%20and%20Lsit/ListView_Widget/Shimmer%20Effect/Shimmer_Listview.dart';
import 'package:provider/provider.dart';

class ListviewDisplay extends StatefulWidget {
  const ListviewDisplay({super.key, required this.category});
  final String category;
  @override
  State<ListviewDisplay> createState() => _ListviewDisplayState();
}

class _ListviewDisplayState extends State<ListviewDisplay> {
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
    final provider = Provider.of<APIService>(context);
    final items = provider.data;

    return FutureBuilder(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerListview();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Listcard(
                title: item['title'],
                image: 'https://ingredients-api-production.up.railway.app/data/${item['image']}',
                tap: () {
                  // Handle tap
                },
              );
            },
          );
        }
      },
    );
  }
}
