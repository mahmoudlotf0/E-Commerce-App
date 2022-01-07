import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constans/constans.dart';
import '../../constans/size_config.dart';
import '../screens/login_screen/login_screen.dart';

class DefualtButton extends StatelessWidget {
  final String title;
  final double height;
  final Function()? onTap;
  const DefualtButton({
    required this.onTap,
    required this.title,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(height),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            primary: kPrimaryColor,
          ),
          child: Text(
            title,
            style: GoogleFonts.muli(
              textStyle: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                color: kPrimaryLightColor,
              ),
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
