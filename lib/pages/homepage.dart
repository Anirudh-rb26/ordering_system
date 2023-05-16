import 'package:cloud_firestore/cloud_firestore.dart';
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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        title: Text(
          "Restaurant ABC | Menu",
          style: TextStyle(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            color: CustomColors().buttonColor,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('menuItems').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => MenuItem(
              document: snapshot.data!.docs[index],
            ),
          );
        },
      ),
      bottomNavigationBar: FloatingCheckoutbar(),
    );
  }
}
