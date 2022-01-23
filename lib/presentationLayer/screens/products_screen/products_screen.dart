import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/favourite_screen/favourite_screen.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/build_containter_category.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/collection_categories.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/home_header.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/popular_product.dart';
import 'package:ecommerceapp/presentationLayer/screens/products_screen/components/special_product.dart';
import 'package:ecommerceapp/presentationLayer/screens/profile_screen/profile_screen.dart';
import 'package:ecommerceapp/presentationLayer/widgets/bottom_navigation_widget.dart';
import 'package:ecommerceapp/presentationLayer/widgets/cirular_indecator_widget.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/presentationLayer/widgets/no_internet_widget.dart';

import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'ProductsScreen';

  const ProductsScreen({Key? key}) : super(key: key);
  // TODO: Add RefreshIndicatior Widget to Get All Prodcut
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder:
          (BuildContext ctx, ConnectivityResult value, Widget child) {
        final bool isConnected = value != ConnectivityResult.none;
        if (isConnected) {
          return buildProductScreenBody();
        } else {
          return const NoInternetWidget();
        }
      },
      child: const NoInternetWidget(),
    );
  }

  Widget buildProductScreenBody() {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        return SafeArea(
          child: cubit.allProducts.isEmpty
              ? const CircularIndecatorWidget()
              : Scaffold(
                  bottomNavigationBar: BottomNavigationWidget(cubit: cubit),
                  body: cubit.currentIndex == 0
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenHeight(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HomeHeader(),
                                customSizeBox(height: 30),
                                const BuildContainerCategory(),
                                customSizeBox(height: 30),
                                const CollectionCategories(),
                                customSizeBox(height: 30),
                                SpecialProduct(cubit: cubit),
                                customSizeBox(height: 30),
                                PopularProduct(cubit: cubit),
                              ],
                            ),
                          ),
                        )
                      : cubit.currentIndex == 1
                          ? const FavouriteScreen()
                          : const ProfileScreen(),
                ),
        );
      },
    );
  }
}
