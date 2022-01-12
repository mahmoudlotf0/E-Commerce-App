import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildContainerCategory extends StatelessWidget {
  const BuildContainerCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Move to Category Screen
      },
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF4A4598),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(20)),
          child: Text(
            'Category',
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(40.0),
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
