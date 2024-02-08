import 'package:flutter/material.dart';
import 'package:app_flutt/pages/intropage.dart';
import 'package:app_flutt/pages/homepage.dart';
import 'package:app_flutt/model/cart.dart';
import 'package:provider/provider.dart';

//login process
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_flutt/pages/loginPage.dart';
import 'package:app_flutt/pages/signup%20page.dart';
import 'package:app_flutt/pages/Auth%20controller.dart';
import 'package:app_flutt/pages/Log%20outpage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp().then((value) => Get.put(Authcontroller()));
  runApp( const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => cart(),
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const loginPage(),

    
      //navigating another pages (like key)
      routes: {
          "/login Page" :(context) =>  loginPage(),
           "/register Page" :(context) =>  Signupage(),
           "/logout Page" :(context) =>  LogOut_page(email: '',),

          "/intro page" :(context) =>  Intropage(),
          "/home page" :(context) =>  homepage(),


      },
      
    ),
     );
    
  }
}