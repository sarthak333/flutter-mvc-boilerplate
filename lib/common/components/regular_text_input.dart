import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularTextInput extends StatelessWidget {
  final label;
  final controller;
  final hintText;
  final prefix;
  final keyboardType;

  RegularTextInput({
    this.keyboardType,
    this.label = "Label",
    this.controller,
    this.hintText = "Enter data here",
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 15,
                color: labelBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(14),
                prefix: prefix ?? null,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: Color(0xFFC5CACD), width: 1.0),
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
