import 'package:app_flutt/pages/cart%20page.dart';
import 'package:app_flutt/pages/shop%20page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/bottom nav.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int selectedindex = 0;

  void navbottombar(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> pages = [const Shoppage(), const CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      //botom nav bar
      bottomNavigationBar: bottom_navbar(
        onTabChange: (index) => navbottombar(index),
      ),
      body: pages[selectedindex],

      //app bar
      appBar: AppBar(
        title: Center(
          child: Text(
            "Sneaky",
            style: GoogleFonts.pacifico(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        //appbar's icon color
        iconTheme: const IconThemeData(color: Colors.black),
        //search button
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              })
        ], //colour the menu button
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DrawerHeader(
                      child: Image.asset(
                    "images/jorden.png",
                    color: Colors.white,
                  )),
                ),
                //drawer title
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //about botton
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text("About",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),

            //logout botton
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/logout Page");
              },
              child: const Padding(
                padding: EdgeInsets.all(25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text("Logout",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//this for search button
class CustomSearch extends SearchDelegate {
  final List<String> searchAll = [
    'Air Jordan Legacy 312',
    'Jordan Nu Retro 1',
    'Jordan Stadium 90',
    'Tatum 1 Home Team PF',
    'Air Jordan 11 Retro IE',
    'Air Jordan 1 Mid',
    'Luka 2'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> matchQuery = searchAll
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> matchQuery = searchAll
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }
}
