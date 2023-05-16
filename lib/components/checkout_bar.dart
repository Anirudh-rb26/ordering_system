import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

SafeArea FloatingCheckoutbar() {
  return SafeArea(
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(300, 0, 300, 15),
      height: 64,
      decoration: BoxDecoration(
        color: CustomColors().backgroundColor.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: CustomColors().highlightColor2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Total: ₹30,000",
                style: TextStyle(color: CustomColors().headlineColor),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: CustomColors().highlightColor2,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: CustomColors().highlightColor2,
              ),
              icon: Icon(
                Icons.label,
                size: 24.0,
                color: CustomColors().headlineColor,
              ),
              label: Text(
                'Apply Coupon Codes',
                style: TextStyle(
                  color: CustomColors().headlineColor,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
