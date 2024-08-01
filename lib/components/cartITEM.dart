import 'package:app_flutt/model/cart.dart';
import 'package:app_flutt/model/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key,required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context,listen: false).removeItemFromCart(widget.shoe);  //change need
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(9)),

        margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: Image.asset(widget.shoe.image_path),
        title: Text(widget.shoe.Name),
        subtitle: Text(widget.shoe.Price),
        trailing: IconButton(
          onPressed: removeItemFromCart,
         icon: const Icon(Icons.delete)),
      ),
    );
  }
}
