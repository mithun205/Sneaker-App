//import 'package:app_flutt/pages/homepage.dart';
import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(60),
                child: Center(
                  child: Image.asset('images/jorden.png',
                  height: 150,),
                ),
              ),
        
              //title
              const Padding(
                padding: EdgeInsets.all(15),
                child:  Text("JUST DO IT",
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25)),
              ),
              
              
              //subtitle
               Text(
                "Brand new sneakers and custom kicks are made with premium quality.",
                style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]),
                textAlign: TextAlign.center,),
      
                const SizedBox(height: 50),
                
              //shop now box
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/home page");
                },
                

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                    ),
                    
                    child: const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: Text("Shop Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      ),
                    ),
                    
                ),
              )
        
        
            ],
          ),
      ),
      
    );
  }
}