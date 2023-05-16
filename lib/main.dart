import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordering_system/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Now',
      theme: ThemeData(
        fontFamily: GoogleFonts.comfortaa().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const homepage(),
    );
  }
}
