import 'package:app_flutt/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe title.dart';
import '../model/shoe.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe){
     Provider.of<cart>(context, listen: false).addItemToCart(shoe);

     //alert the user
     showDialog(context: context,
      builder: ((context) => const AlertDialog(
        title: Text("Successfully added!"),
        content: Text("Check your cart"),
      )));
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<cart>(
      builder: (context, value, child) => Column(
      children: [

       //message
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("everyone flies..but some fly longer than others ",
          style: TextStyle(color: Colors.grey[700]),),
        ),

        const SizedBox(height: 10),//it gives the gap for nxt line

        Expanded(
          
          child:ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            
            itemBuilder: (context, index) {
              //get a shoe from shop list
              Shoe shoe=value.getshoelist()[index];
          //return the shoe
          return shoe_title(
            onTap: () => addShoeToCart(shoe),
            shoe: shoe,
          );
        },),),
      ],
    ) );
    
  }
}