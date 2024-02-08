import 'package:app_flutt/components/cartITEM.dart';
import 'package:app_flutt/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/shoe.dart';

class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(builder: (context, value, child) => 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("My Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

          const SizedBox(height: 15),


          Expanded(child: ListView.builder(
            itemCount: value.getusercart().length,
            itemBuilder: (context, index) {
            Shoe individualShoe= value.getusercart()[index];

            return CartItem(
              shoe: individualShoe
            );
          },))
        ],
      ),
    ),);
  }
}