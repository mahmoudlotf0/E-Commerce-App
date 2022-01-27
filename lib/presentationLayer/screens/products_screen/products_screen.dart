import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../favourite_screen/favourite_screen.dart';
import 'components/build_containter_category.dart';
import 'components/collection_categories.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_product.dart';
import '../profile_screen/profile_screen.dart';
import '../../widgets/bottom_navigation_widget.dart';
import '../../widgets/cirular_indecator_widget.dart';
import '../../widgets/no_internet_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                              horizontal: 20.r,
                              vertical: 15.r,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HomeHeader(),
                                SizedBox(height: 20.h),
                                const BuildContainerCategory(),
                                SizedBox(height: 20.h),
                                const CollectionCategories(),
                                SizedBox(height: 20.h),
                                SpecialProduct(cubit: cubit),
                                SizedBox(height: 20.h),
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
