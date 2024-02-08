import 'package:app_flutt/components/google_button.dart';
import 'package:app_flutt/pages/Auth%20controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: // safearea for avoid the notch area

          SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'images/nike.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 30),

            // welcome back, you've been missed!
            Text(
              'Welcome back you\'ve been missed!',
              style:GoogleFonts.aboreto(
                color: Colors.grey[1000],
                fontSize: 16,)
               
              ),
            

            const SizedBox(height: 25),
            //text boxx

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.grey[800]),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.grey[800]),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility),
                          color: Colors.black,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            GestureDetector(
              onTap: () {
                Authcontroller.instances.login(
                  emailcontroller.text.trim(),
                  passwordcontroller.text.trim());
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[600],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:() => googlebutton().signInWithGoogle(),

                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      "images/google.png",
                      height: 30,
                    ),
                  ),
                ),               
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/register Page");
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
