import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Home.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/Search.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/cart.dart';
import 'package:ingredient_cooker/features/presentation/pages/Nav_Bar_Pages/heart.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Provider_Bottom_NavBar.dart';
import 'package:provider/provider.dart';

class Nav_Bar extends StatefulWidget {
  
  const Nav_Bar({super.key,});

  @override
  State<Nav_Bar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  List _WidgetScreen = [Home(location: '',), Search(), Favourite(), Cart()];
  @override
  Widget build(BuildContext context) {
    final Nav_prov = Provider.of<Nav_Pov>(context);
    return Scaffold(
        body: _WidgetScreen.elementAt(Nav_prov.indexSelect),
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
          ]),
          child: GNav(
            selectedIndex: Nav_prov.indexSelect,
            onTabChange: (value) {
              Nav_prov.indexCount(value);
            },
            rippleColor: Colors.white,
            tabBorderRadius: 35,
            tabActiveBorder: Border.all(
              color: Color.fromRGBO(12, 154, 97, 1),
              width: 1,
            ),
            gap: 5,
            tabMargin: EdgeInsets.all(10),
            activeColor: Color.fromRGBO(12, 154, 97, 1),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            curve: Curves.linear,
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            tabs: [
              GButton(
                icon: Icons.home_rounded,
                text: "Home",
              ),
              GButton(
                icon: EvaIcons.search,
                text: "Search",
              ),
              GButton(
                icon: AntDesign.heart_outline,
                text: "Favourite",
              ),
              GButton(
                icon: AntDesign.shopping_cart_outline,
                text: "Cart",
              )
            ],
          ),
        ));
  }
}
