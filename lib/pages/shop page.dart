import 'package:app_flutt/components/shoe%20title.dart';
import 'package:app_flutt/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/shoe.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user
    showDialog(
      context: context,
      builder: ((context) => const AlertDialog(
            title: Text("Successfully added!"),
            content: Text("Check your cart"),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => ListView(
        children: [
          // Message
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Everyone flies..but some fly longer than others",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),

          // Baanner images
          SizedBox(                                   
            height: 190, // Adjust height as needed
            child: ListView(
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/banner 1.png'),
                  ),
                ), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/banner 5.png'),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/banner 3.png'),
                  ),
                ), // 
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,),
            child: Text("Categories",
            style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
          ),

          SizedBox(
  height: 150, 
  child: ListView(
    padding: const EdgeInsets.all(5),
    scrollDirection: Axis.horizontal,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/casual shoe.png', height: 90), 
            ),
            const SizedBox(height: 5),
            const Text('Casual Shoes'), 
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/formal shoe.png', height: 90), 
            ),
            const SizedBox(height: 5),
            const Text('Formal Shoes'), 
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/sport shoe.png', height: 90), 
            ),
            const SizedBox(height: 5),
            const Text('Sport Shoes'), 
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/Seasonal shoe.png', height: 90), 
            ),
            const SizedBox(height: 5),
            const Text('Seasonal Shoes'), 
          ],
        ),
      ),
    ],
  ),
),

//SizedBox(height: 0,),
          // ListView.builder inside a Column
          Column(
            children: List.generate(value.getshoelist().length, (index) {
              // Get a shoe from shop list
              Shoe shoe = value.getshoelist()[index];
              // Return the shoe
              return shoe_title(
                onTap: () => addShoeToCart(shoe),
                shoe: shoe,
              );
            }),
          ),
        ],
      ),
    );
  }
}
