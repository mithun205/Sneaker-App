import 'package:app_flutt/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context); // Access the cart

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,  // Optional: Removes the shadow under the app bar
        title: const Text(
          'Payment Methods',
          style: TextStyle(color: Colors.black),  // Optional: Change the title color
        ),
        iconTheme: const IconThemeData(color: Colors.black),  // Optional: Change the back button color
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: ListView(
          children: [
            const SizedBox(height: 20),  // Optional: Add space between AppBar and content
            buildPaymentOption(
              context,
              "UPI",
              [
                ListTile(
                  title: Center(
                    child:Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                      child: Text("₹${cart.getTotalAmount().toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),) 
                    
                  ),
                  onTap: () {
                    // Handle amount entry
                  },
                ),
                ListTile(
                  title: const Text("GPay"),
                  onTap: () {
                    // Handle GPay selection
                  },
                ),
                ListTile(
                  title: const Text("PhonePe"),
                  onTap: () {
                    // Handle PhonePe selection
                  },
                ),
              ],
            ),
            buildPaymentOption(
              context,
              "Card",
              [
                ListTile(
                  title: const Text("Enter Card Details"),
                  onTap: () {
                    // Handle card details entry
                  },
                ),
              ],
            ),
            buildPaymentOption(
              context,
              "Net Banking",
              [
                ListTile(
                  title: const Text("SBI"),
                  onTap: () {
                    // Handle SBI selection
                  },
                ),
                ListTile(
                  title: const Text("HDFC"),
                  onTap: () {
                    // Handle HDFC selection
                  },
                ),
                ListTile(
                  title: const Text("Union Bank"),
                  onTap: () {
                    // Handle Union Bank selection
                  },
                ),
              ],
            ),
            buildPaymentOption(
              context,
              "Cash on Delivery",
              [
                ListTile(
                  title: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '₹${cart.getTotalAmount().toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle amount entry
                  },
                ),
              ],)
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(BuildContext context, String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: children,
    );
  }
}
