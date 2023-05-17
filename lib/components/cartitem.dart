// import 'package:dotted_decoration/dotted_decoration.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../constants/custom_colors.dart';

// class CartItem extends StatelessWidget {
//   String itemName;
//   double price;

//   CartItem({super.key, required this.itemName, required this.price});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 450,
//       height: 50,
//       decoration: DottedDecoration(
//         shape: Shape.line,
//         linePosition: LinePosition.bottom,
//         color: CustomColors().backgroundColor.withOpacity(0.5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       CupertinoIcons.minus_circled,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     itemName,
//                     style: TextStyle(
//                       fontFamily: GoogleFonts.kalam().fontFamily,
//                       color: CustomColors().buttonTextColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 "₹$price",
//                 style: TextStyle(
//                   fontFamily: GoogleFonts.kalam().fontFamily,
//                   color: CustomColors().buttonTextColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
