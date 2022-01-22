import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/product_details_screen.dart';
import 'package:ecommerceapp/presentationLayer/widgets/cirular_indecator_widget.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class PopularProduct extends StatelessWidget {
  final ShopCubit cubit;
  const PopularProduct({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cubit.allProducts.isEmpty
        ? const CircularIndecatorWidget()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Product',
                style: kHeadLineTwo.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              customSizeBox(height: 20),
              customSizeBox(
                width: SizeConfig.screenWidth,
                height: getProportionateScreenHeight(200),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // TODO: Sort List of height count
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailsScreen.routeName,
                          arguments: cubit.allProducts[index],
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(20.0),
                        ),
                        child: Column(
                          children: [
                            buildImage(index),
                            buildTitle(index),
                            buildCategoryName(index),
                            Row(
                              children: [
                                buildPrice(index),
                                buildLikeButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
          );
  }

  Widget buildImage(int index) {
    return Container(
      width: SizeConfig.screenWidth * 0.4,
      height: getProportionateScreenHeight(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          getProportionateScreenHeight(15),
        ),
        child: cubit.allProducts[index].image.isNotEmpty
            ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                placeholder: 'assets/icons/loading.gif',
                image: cubit.allProducts[index].image,
              )
            : Image.asset('assets/icons/loading.gif'),
      ),
    );
  }

  Widget buildTitle(int index) {
    return customSizeBox(
      width: SizeConfig.screenWidth * 0.35,
      height: getProportionateScreenHeight(20),
      child: Text(
        cubit.allProducts[index].title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: kTextColor,
          ),
        ),
      ),
    );
  }

  Widget buildCategoryName(int index) {
    return customSizeBox(
      width: SizeConfig.screenWidth * 0.35,
      height: getProportionateScreenHeight(20),
      child: Text(
        cubit.allProducts[index].category.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildPrice(int index) {
    return customSizeBox(
      width: SizeConfig.screenWidth * 0.35,
      height: getProportionateScreenHeight(20),
      child: Text(
        '\$${cubit.allProducts[index].price}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.muli(
          textStyle: const TextStyle(
            fontSize: 20.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLikeButton() {
    return LikeButton(
      size: getProportionateScreenWidth(20),
      // TODO: When tap go to favotite list
    );
  }
}
