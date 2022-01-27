import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

import '../../../DataLayer/model/product.dart';
import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../constans/constans.dart';
import '../../../constans/size_config.dart';
import 'components/build_circle_color.dart';
import 'components/build_number_product.dart';
import 'components/build_rating_and_count_widget.dart';
import 'components/build_sizes_product_widget.dart';
import '../../widgets/defualt_button.dart';
import '../../widgets/divider_widget.dart';
import '../../../themes/text_styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'ProductsDetailsScreen';
  final Product product;
  const ProductDetailsScreen({required this.product, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
            cubit.resetNumberProduct();
            return true;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.r,
                vertical: 15.r,
              ),
              child: Column(
                children: [
                  buildHeader(context),
                  SizedBox(height: 25.h),
                  buildImage(),
                  const DividerWidget(),
                  buildTitleWithLikeBurron(context),
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
                    height: 50.h,
                  ),
                ],
              ),
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
        buildArrowBack(context),
        buildCartIcon(),
      ],
    );
  }

  Widget buildCartIcon() {
    return GestureDetector(
      onTap: () {
        // TODO: Go To Cart Screen
      },
      child: Container(
        width: 46.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: SvgPicture.asset('assets/icons/Cart Icon.svg'),
        ),
      ),
    );
  }

  Widget buildArrowBack(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[50],
      ),
      child: IconButton(
        onPressed: () {
          ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
          Navigator.of(context).pop();
          cubit.resetNumberProduct();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kSecondaryColor,
        ),
      ),
    );
  }

  Widget buildImage() {
    return SizedBox(
      height: 220.h,
      width: SizeConfig.screenWidth,
      child: Image.network(product.image),
    );
  }

  Widget buildLikeButton(BuildContext context) {
    return Container(
      width: 50.w,
      height: 45.h,
      margin: EdgeInsets.only(
        bottom: 10.h,
        left: 10.w,
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
        onTap: (bool isLiked) async {
          ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
          cubit.addOrRemoveProuductFromFavourites(product.id);
          return cubit.isProductFavourite(product.id) ? true : false;
        },
      ),
    );
  }

  Widget buildTitleWithLikeBurron(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            product.title,
            style: kHeadLineTwo.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 3,
          ),
        ),
        buildLikeButton(context),
      ],
    );
  }

  Widget buildDescription() {
    return AutoSizeText(
      product.description,
      style: kHeadLineThree,
      maxLines: 8,
    );
  }
}
