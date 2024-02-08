import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class bottom_navbar extends StatelessWidget {
  void Function(int)? onTabChange;
   bottom_navbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        
        color: Colors.grey,      
        //tabActiveBorder:Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        onTabChange: (value) =>onTabChange!(value),
        
        tabs: const [
          GButton(icon: Icons.home,
          text: "Shop"),

          GButton(icon: Icons.shopping_bag,
          text: "Cart"),
          
          ],
        ),
    );
  }
}