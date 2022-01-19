import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Container(
      width: SizeConfig.screenWidth * 0.6,
      height: getProportionateScreenHeight(45),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: searchController,
        cursorColor: Colors.grey[700],
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search Product',
          hintStyle: GoogleFonts.muli(
            textStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
