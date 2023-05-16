import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordering_system/constants/custom_colors.dart';

import '../components/cartitem.dart';
import '../components/checkout_bar.dart';
import '../components/custom_divider.dart';
import '../components/menuitem.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Restaurant ABC | Menu",
          style: TextStyle(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            color: CustomColors().buttonColor,
          ),
        ),
      ),
      body: IntrinsicHeight(
        child: Row(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var menuItemCount = 100.0;
                      menuItemCount >= 1;
                      menuItemCount--) ...[
                    MenuItem(
                      itemName: "Menu Item: $menuItemCount",
                      itemDescription: "Something about the dish....",
                      price: menuItemCount,
                    ),
                  ]
                ],
              ),
            ),
            const CustomDivider(),
            Container(
              height: 700,
              width: 490,
              decoration: BoxDecoration(color: CustomColors().buttonColor),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var itemCount = 100.0;
                        itemCount >= 1;
                        itemCount--) ...[
                      CartItem(
                        itemName: "Item Ordered: $itemCount",
                        price: itemCount,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingCheckoutbar(),
    );
  }
}
