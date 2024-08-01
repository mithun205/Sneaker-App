import 'package:flutter/material.dart';

import '../model/shoe.dart';

class shoe_title extends StatefulWidget {
  Shoe shoe;
  void Function()? onTap;
  shoe_title({super.key, required this.shoe, required this.onTap});

  @override
  State<shoe_title> createState() => _shoe_titleState();
}

class _shoe_titleState extends State<shoe_title> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, bottom: 35, right: 35),
      //width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[500]),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(widget.shoe.image_path)),

          //description
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(widget.shoe.Description, textAlign: TextAlign.center),
          ),
          // shoe name and plus button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // shoe name and price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.shoe.Name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.shoe.Price,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ),
              // plus button
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
