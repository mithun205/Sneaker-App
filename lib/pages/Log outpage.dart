import 'package:app_flutt/pages/Auth%20controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:get/get.dart';

class LogOut_page extends StatelessWidget {
  String email;
  
  LogOut_page({super.key, required this.email,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              "images/nike.png",
              height: 300,
            ),
          ),
          //title
           Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Hello",
              style:GoogleFonts.aboreto(
                color: Colors.grey[1000],
                fontSize: 16,)
            ),
          ),
          //sub title
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              email,
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: 60),
          GestureDetector(
            onTap: () {
              Authcontroller.instances.logout();
            },
            child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
