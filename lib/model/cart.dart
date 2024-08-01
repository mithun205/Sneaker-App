import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale you can able to add or remove this objects
  List<Shoe> shoeShop = [
    Shoe(
      Name: 'Air Jordan Legacy 2',
      Price: 'MRP : ₹ 12,995.00',
      image_path: 'images/shoe 1.png',
      Description: """Celebrate MJ's legacy with this shout-out to Chicago's 312 area code. With elements from three iconic Jordans (the AJ3, AJ1 and Air Alpha Force)"""
    ),
    Shoe(
      Name: 'Jordan Nu Retro 1',
      Price: 'MRP : ₹ 9,195.00',
      image_path: 'images/shoe 2.png',
      Description: """Twenty years later and these low tops are back. Inspired by the original Wings logo and design of the Jordan 1, these all-day."""
    ),
    Shoe(
      Name: 'Jordan Stadium 90',
      Price: 'MRP : ₹ 12,795.00',
      image_path: 'images/shoe  3.png',
      Description: """Comfort is king, but that doesn't mean you have to sacrifice style. Taking design inspiration from the AJ1 and AJ5."""
    ),
    Shoe(
      Name: 'Tatum 1 Home TeamPF',
      Price: 'MRP : ₹ 10,795.00',
      image_path: 'images/shoe 4.png',
      Description: """Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind."""
    ),  
    Shoe(
      Name: 'Air Jordan 11 Retro IE',
      Price: 'MRP : ₹ 16,995.00',
      image_path: 'images/shoe 5.png',
      Description: """The Air Jordan 11 Retro Low IE Shoe offers a fresh take on one of the most beloved Jordan designs ever."""
    ),
    Shoe(
      Name: 'Air Jordan 1 Mid',
      Price: 'MRP : ₹ 11,495.00',
      image_path: 'images/shoe 6.png',
      Description: """Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours."""
    ),     
    Shoe(
      Name: 'Luka 2',
      Price: 'MRP : ₹ 7,495.00',
      image_path: 'images/shoe 7.png',
      Description: """You bring the speed. We'll bring the stability. The Luka 2 is built to support your skills."""
    ), 
    Shoe(
      Name: 'Luka 3',
      Price: 'MRP : ₹ 7,495.00',
      image_path: 'images/shoe 7.png',
      Description: """You bring the speed. We'll bring the stability. The Luka 2 is built to support your skills."""
    ),             
  ];

  // List of items in user cart
  List<Shoe> usercart = [];

  List<Shoe> getshoelist() {
    return shoeShop;
  }

  List<Shoe> getusercart() {
    return usercart;
  }

  void addItemToCart(Shoe shoe) {
    usercart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    usercart.remove(shoe);
    notifyListeners();
  }

  // Method to calculate the total amount of items in the cart
  double getTotalAmount() {
    double total = 0;
    for (var shoe in usercart) {
      total += double.parse(shoe.Price.replaceAll(RegExp(r'[^0-9.]'), ''));
    }
    return total;
  }
}
