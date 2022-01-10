import 'package:ecommerceapp/DataLayer/model/product.dart';
import 'package:ecommerceapp/businessLogicLayer/cubit/shopcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'ProductsScreen';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (BuildContext context, ShopState state) {},
      builder: (BuildContext context, ShopState state) {
        ShopCubit cubit = ShopCubit.getObjectFromShopCubit(context);
        cubit.getAllProducts();
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: cubit.products.map((e) {
              return Center(
                child: ElevatedButton(
                  child: const Text('Get Data'),
                  onPressed: () {
                    print(e.title);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
