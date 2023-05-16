import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/custom_colors.dart';

class MenuItem extends StatelessWidget {
  String itemName;
  String itemDescription;
  double price;

  MenuItem({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 1000,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColors().buttonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColors().buttonTextColor,
                        ),
                      ),
                      Text(
                        itemDescription,
                        style: TextStyle(
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          fontSize: 14,
                          color: CustomColors().buttonTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "₹$price",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors().buttonTextColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.add_circled),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
