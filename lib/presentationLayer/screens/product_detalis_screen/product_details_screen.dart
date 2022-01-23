import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/components/build_number_product.dart';
import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/components/build_rating_and_count_widget.dart';
import 'package:ecommerceapp/presentationLayer/widgets/defualt_button.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/constans/constans.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/components/build_circle_color.dart';
import 'package:ecommerceapp/presentationLayer/screens/product_detalis_screen/components/build_sizes_product_widget.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/build_cart_container.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/presentationLayer/widgets/divider_widget.dart';
import 'package:ecommerceapp/themes/text_styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'ProductsDetailsScreen';
  final Product product;
  const ProductDetailsScreen({required this.product, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(15),
            ),
            child: Column(
              children: [
                buildHeader(context),
                customSizeBox(height: 30),
                buildImage(),
                const DividerWidget(),
                buildTitleWithLikeBurron(),
                buildDescription(),
                // * Divider
                const DividerWidget(),
                const BuildCircleColor(),
                // * Divider
                const DividerWidget(),
                const BuildSizesProducrWidget(),
                // * Divider
                const DividerWidget(),
                BuildRatingAndCountWidget(product: product),
                // * Divider
                const DividerWidget(),
                const BuildNumberProduct(),
                DefualtButton(
                  onTap: () {
                    // TODO: Add product to chart
                  },
                  title: 'Add to Chart',
                  height: getProportionateScreenHeight(60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
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
        GestureDetector(
          onTap: () {
            // TODO : GO TO CART SCREEN
          },
          child: const BuildCartContainer(),
        ),
      ],
    );
  }

  Widget buildImage() {
    return customSizeBox(
      height: SizeConfig.screenHeight * 0.35,
      width: SizeConfig.screenWidth,
      child: Image.network(product.image),
    );
  }

  Widget buildLikeButton() {
    return Container(
      width: getProportionateScreenWidth(64),
      height: getProportionateScreenHeight(50),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(10),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFE6E6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: LikeButton(
        size: getProportionateScreenWidth(30),
      ),
    );
  }

  Widget buildTitleWithLikeBurron() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.title,
            style: kHeadLineTwo.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 3,
          ),
        ),
        buildLikeButton(),
      ],
    );
  }

  Widget buildDescription() {
    return Text(
      product.description,
      style: kHeadLineThree,
    );
  }
}
