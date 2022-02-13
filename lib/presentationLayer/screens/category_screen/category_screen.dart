import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/category_details_screen/category_details_screen.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'CategoryScreen';
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CategoryDetailsscreen.routeName,
                  arguments: categoryName[index],
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.r,
                  vertical: 5.r,
                ),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Stack(
                    children: [
                      buildImage(index),
                      buildShadow(),
                      buildTitle(index),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }

  Widget buildTitle(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.r,
        vertical: 20.r,
      ),
      child: AutoSizeText(
        categoryName[index],
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        'Categories',
        style: kHeadLineOneWithPrimaryColor,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[50],
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  Widget buildImage(int index) {
    return Image.asset(
      images[index],
      fit: BoxFit.cover,
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.22,
    );
  }

  Widget buildShadow() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF343434).withOpacity(0.4),
            const Color(0xFF343434).withOpacity(0.15),
          ],
        ),
      ),
    );
  }
}
